#!/usr/bin/env bash
# PostToolUse hook (matcher: Edit|Write)
# Lints and formats a Python file after Claude edits it.

input=$(cat)
file=$(echo "$input" | jq -r '.tool_input.file_path // empty')

[[ "$file" == *.py ]] || exit 0
cd "$CLAUDE_PROJECT_DIR" || exit 0

uv run ruff check --fix "$file" >/dev/null 2>&1
if uv run ruff format "$file" >/dev/null 2>&1; then
  echo "ruff formatted $file"
  exit 0
else
  echo "ruff-format.sh: ruff failed on $file" >&2
  exit 1
fi