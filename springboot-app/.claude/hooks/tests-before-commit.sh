#!/usr/bin/env bash
# PreToolUse hook (matcher: Bash)
# Runs the tests before Claude commits; exit 2 blocks the commit.

input=$(cat)
command=$(echo "$input" | jq -r '.tool_input.command // empty')

# Only gate git commit; let every other Bash command through
if ! echo "$command" | grep -Eq '(^|[;&| ])git +commit'; then
  exit 0
fi

cd "$CLAUDE_PROJECT_DIR" || exit 0

if ./mvnw -q test > /tmp/claude-precommit.log 2>&1; then
  exit 0
else
  echo "Commit blocked: ./mvnw test has failures. Fix them, then commit again. Last lines:" >&2
  tail -n 20 /tmp/claude-precommit.log >&2
  exit 2
fi