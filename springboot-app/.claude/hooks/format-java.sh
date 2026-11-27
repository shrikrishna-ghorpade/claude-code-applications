#!/usr/bin/env bash
# PostToolUse hook (matcher: Edit|Write)
# Formats a Java file after Claude edits it. Needs the Spotless plugin in pom.xml.

input=$(cat)
file=$(echo "$input" | jq -r '.tool_input.file_path // empty')

# Only act on Java files
[[ "$file" == *.java ]] || exit 0

cd "$CLAUDE_PROJECT_DIR" || exit 0

if ./mvnw -q spotless:apply -DspotlessFiles="$file" >/dev/null 2>&1; then
  echo "Formatted $file"
  exit 0
else
  echo "format-java.sh: formatting failed for $file (is Spotless configured?)" >&2
  exit 1   # non-blocking: the edit already happened
fi