#!/usr/bin/env bash
# PreToolUse hook (matcher: Bash)
# Blocks dangerous shell commands before Claude runs them.

input=$(cat)
command=$(echo "$input" | jq -r '.tool_input.command // empty')

blocked_patterns=(
  "rm -rf"
  "git push --force"
  "git reset --hard"
  "DROP TABLE"
  "curl .*\| *sh"
)

for pattern in "${blocked_patterns[@]}"; do
  if echo "$command" | grep -Eiq "$pattern"; then
    echo "BLOCKED by block-dangerous-bash.sh: '$command' matches '$pattern'. Ask the user to run it manually if needed." >&2
    exit 2
  fi
done

exit 0