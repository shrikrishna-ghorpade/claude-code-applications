#!/usr/bin/env bash
# Stop hook (no matcher): runs when Claude is about to finish its reply.
# Exit 2 = Claude must keep working; stderr tells it why.

input=$(cat)

# Avoid an endless loop: if Claude is already continuing because of this hook, let it stop.
if [[ "$(echo "$input" | jq -r '.stop_hook_active // false')" == "true" ]]; then
  exit 0
fi

cd "$CLAUDE_PROJECT_DIR" || exit 0

# Skip the gate when nothing changed under src/
if git diff --quiet -- src/ && git diff --cached --quiet -- src/; then
  exit 0
fi

if ./mvnw -q test > /tmp/claude-mvn-test.log 2>&1; then
  exit 0
else
  echo "Quality gate failed: ./mvnw test has failures. Fix them before finishing. Last lines:" >&2
  tail -n 20 /tmp/claude-mvn-test.log >&2
  exit 2
fi