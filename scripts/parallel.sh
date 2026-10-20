#!/usr/bin/env bash
# Run 1-3 coding agents in parallel, each in its own git worktree and branch,
# each on its own task file. Headless: claude -p, codex exec, opencode run.
# Safe defaults: no permission bypass, no push, .env is NOT copied.
set -euo pipefail

MAX_TASKS=3
TOOL="claude"
MODEL=""
DRY_RUN=0
TASKS=()

usage() {
  cat <<'EOF'
Usage: scripts/parallel.sh [options] TASK_FILE [TASK_FILE [TASK_FILE]]

Runs one agent per task file (max 3), each in its own git worktree
(a separate working copy of the repo) on a new branch agent/<task-name>.
Worktrees are created next to the repo: ../<repo>-<task-name>
Logs go to .parallel-logs/<task-name>.log

Options:
  -t, --tool NAME    claude (default), codex, or opencode
  -m, --model NAME   model to pass to the tool (optional)
  -n, --dry-run      show what would happen, change nothing
  -h, --help         show this help

Examples:
  scripts/parallel.sh tasks/main-screen.md tasks/data-import.md
  scripts/parallel.sh --tool codex tasks/a.md tasks/b.md tasks/c.md
  scripts/parallel.sh --tool opencode --model <provider>/<model> tasks/a.md

Safe defaults:
  claude    edits files automatically; shell commands limited to git
            add/commit/status/diff/log (--permission-mode acceptEdits)
  codex     sandbox workspace-write (writes only inside the worktree)
  opencode  the permission rules from your opencode config
  Agents never push. Your .env is not copied into worktrees; copy it
  yourself only if a task needs it.

Each agent starts from your last commit. Commit before running.

After the run:
  git log --oneline main..agent/<task-name>      # what the agent did
  git merge agent/<task-name>                     # keep it
  git worktree remove ../<repo>-<task-name>      # clean up
  git branch -D agent/<task-name>                 # drop the branch
EOF
}

die() { echo "Error: $*" >&2; echo "Run with --help for usage." >&2; exit 1; }

while [ $# -gt 0 ]; do
  case "$1" in
    -t|--tool)    [ $# -ge 2 ] || die "$1 needs a value"; TOOL="$2"; shift 2 ;;
    -m|--model)   [ $# -ge 2 ] || die "$1 needs a value"; MODEL="$2"; shift 2 ;;
    -n|--dry-run) DRY_RUN=1; shift ;;
    -h|--help)    usage; exit 0 ;;
    --)           shift; while [ $# -gt 0 ]; do TASKS+=("$1"); shift; done ;;
    -*)           die "unknown option: $1" ;;
    *)            TASKS+=("$1"); shift ;;
  esac
done

[ "${#TASKS[@]}" -ge 1 ] || { usage; exit 1; }
[ "${#TASKS[@]}" -le "$MAX_TASKS" ] || die "at most $MAX_TASKS tasks at once (got ${#TASKS[@]})"

case "$TOOL" in
  claude|codex|opencode) ;;
  *) die "unsupported tool: $TOOL (use claude, codex, or opencode)" ;;
esac
command -v "$TOOL" >/dev/null 2>&1 || die "'$TOOL' is not installed or not on PATH"
command -v git >/dev/null 2>&1 || die "git is not installed"

REPO_ROOT="$(git rev-parse --show-toplevel 2>/dev/null)" || die "run this inside a git repository"
git -C "$REPO_ROOT" rev-parse --verify --quiet HEAD >/dev/null || die "the repo has no commits yet; commit first"
GIT_COMMON_DIR="$(git -C "$REPO_ROOT" rev-parse --path-format=absolute --git-common-dir)"
REPO_NAME="$(basename "$REPO_ROOT")"
PARENT_DIR="$(dirname "$REPO_ROOT")"
BASE_REF="$(git -C "$REPO_ROOT" symbolic-ref --quiet --short HEAD || git -C "$REPO_ROOT" rev-parse --short HEAD)"
LOG_DIR="$REPO_ROOT/.parallel-logs"

if [ -n "$(git -C "$REPO_ROOT" status --porcelain)" ]; then
  echo "Warning: you have uncommitted changes. Agents start from the last commit and will not see them." >&2
fi

NAMES=(); BRANCHES=(); WORKTREES=(); TASK_PATHS=()
for task in "${TASKS[@]}"; do
  [ -f "$task" ] && [ -r "$task" ] || die "task file not found: $task"
  [ -s "$task" ] || die "task file is empty: $task"
  name="$(basename "$task")"
  name="${name%.*}"
  name="$(printf '%s' "$name" | tr '[:upper:]' '[:lower:]' | tr -c 'a-z0-9._-' '-')"
  [ -n "$name" ] || die "cannot derive a name from: $task"
  for existing in "${NAMES[@]+"${NAMES[@]}"}"; do
    [ "$existing" != "$name" ] || die "two task files map to the same name: $name"
  done
  branch="agent/$name"
  wt="$PARENT_DIR/$REPO_NAME-$name"
  [ ! -e "$wt" ] || die "worktree folder already exists: $wt (remove it or rename the task file)"
  if git -C "$REPO_ROOT" show-ref --verify --quiet "refs/heads/$branch"; then
    die "branch already exists: $branch (delete it or rename the task file)"
  fi
  NAMES+=("$name"); BRANCHES+=("$branch"); WORKTREES+=("$wt")
  TASK_PATHS+=("$(cd "$(dirname "$task")" && pwd)/$(basename "$task")")
done

build_prompt() {
  local branch="$1" task_path="$2"
  cat <<EOF
You are one of several agents working in parallel. You are in a git worktree on branch $branch.
1. Read AGENTS.md and the docs/ folder first.
2. Do ONLY the task below. Stay inside the "Acum" scope of docs/02-spec.md. Do not build anything from "Mai târziu".
3. Commit your work in small commits on this branch. Do not push, merge, or switch branches.
4. When done, write a short summary: what works, how you verified it, what is left.

--- TASK ---
$(cat "$task_path")
EOF
}

run_agent() {
  local wt="$1" prompt="$2"
  case "$TOOL" in
    claude)
      local args=(-p --permission-mode acceptEdits)
      [ -z "$MODEL" ] || args+=(--model "$MODEL")
      args+=(--allowedTools "Bash(git add:*)" "Bash(git commit:*)" "Bash(git status:*)" "Bash(git diff:*)" "Bash(git log:*)")
      (cd "$wt" && printf '%s\n' "$prompt" | claude "${args[@]}")
      ;;
    codex)
      local args=(exec -C "$wt" -s workspace-write --add-dir "$GIT_COMMON_DIR")
      [ -z "$MODEL" ] || args+=(-m "$MODEL")
      printf '%s\n' "$prompt" | codex "${args[@]}" -
      ;;
    opencode)
      local args=(run)
      [ -z "$MODEL" ] || args+=(-m "$MODEL")
      (cd "$wt" && opencode "${args[@]}" "$prompt" </dev/null)
      ;;
  esac
}

echo "Tool: $TOOL${MODEL:+ (model: $MODEL)} | base: $BASE_REF | tasks: ${#TASKS[@]}"
for i in "${!NAMES[@]}"; do
  echo "  ${NAMES[$i]}: ${TASKS[$i]} -> branch ${BRANCHES[$i]}, folder ${WORKTREES[$i]}"
done

if [ "$DRY_RUN" -eq 1 ]; then
  echo "Dry run: nothing was created."
  exit 0
fi

mkdir -p "$LOG_DIR"
PIDS=()
# shellcheck disable=SC2329  # invoked via trap
cleanup() {
  echo "Stopping agents..." >&2
  for pid in "${PIDS[@]+"${PIDS[@]}"}"; do kill "$pid" 2>/dev/null || true; done
  exit 130
}
trap cleanup INT TERM

for i in "${!NAMES[@]}"; do
  git -C "$REPO_ROOT" worktree add --quiet -b "${BRANCHES[$i]}" "${WORKTREES[$i]}" HEAD
  prompt="$(build_prompt "${BRANCHES[$i]}" "${TASK_PATHS[$i]}")"
  log="$LOG_DIR/${NAMES[$i]}.log"
  run_agent "${WORKTREES[$i]}" "$prompt" >"$log" 2>&1 &
  PIDS+=("$!")
  echo "Started ${NAMES[$i]} (log: ${log#"$REPO_ROOT"/})"
done

echo "Waiting for ${#PIDS[@]} agent(s). Follow a log with: tail -f .parallel-logs/<name>.log"
FAILED=0
for i in "${!PIDS[@]}"; do
  if wait "${PIDS[$i]}"; then
    status="done"
  else
    status="FAILED (see log)"; FAILED=1
  fi
  commits="$(git -C "$REPO_ROOT" rev-list --count "$BASE_REF..${BRANCHES[$i]}" 2>/dev/null || echo "?")"
  echo "  ${NAMES[$i]}: $status, $commits new commit(s) on ${BRANCHES[$i]}"
done
trap - INT TERM

cat <<EOF

Next steps:
  git log --oneline $BASE_REF..agent/<name>    # review what an agent did
  git merge agent/<name>                       # keep it (one at a time)
  git worktree remove ../$REPO_NAME-<name>     # clean up
  git branch -D agent/<name>                   # drop the branch
EOF
exit "$FAILED"
