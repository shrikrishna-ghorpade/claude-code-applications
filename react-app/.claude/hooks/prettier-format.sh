#!/usr/bin/env bash
# PostToolUse hook (matcher: Edit|Write)
input=$(cat)
file=$(echo "$input" | jq -r '.tool_input.file_path // empty')

[[ "$file" =~ \.(ts|tsx|js|jsx|css)$ ]] || exit 0
cd "$CLAUDE_PROJECT_DIR" || exit 0

npx prettier --write "$file" >/dev/null 2>&1
if [[ "$file" =~ \.(ts|tsx|js|jsx)$ ]]; then
  npx eslint --fix "$file" >/dev/null 2>&1 || echo "eslint found issues in $file" >&2
fi
exit 0