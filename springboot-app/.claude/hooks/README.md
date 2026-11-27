# hooks/

Scripts run by the hooks defined in ../settings.json. A script here does nothing on its own: settings.json must reference it.

| Script | Event | Matcher | What it does |
|---|---|---|---|
| block-dangerous-bash.sh | PreToolUse | Bash | Blocks risky shell commands before they run |
| format-java.sh | PostToolUse | Edit\|Write | Formats a Java file after Claude edits it |

## The hook contract

1. Claude Code sends the event as JSON on stdin.
2. The script reads it (jq is the easy way).
3. The exit code tells Claude Code what to do.

Example stdin for PreToolUse on Bash:

```json
{
  "session_id": "abc123",
  "cwd": "/Users/you/claude-code-applications/springboot-app",
  "hook_event_name": "PreToolUse",
  "tool_name": "Bash",
  "tool_input": { "command": "rm -rf target" }
}
```

| Exit code | Meaning |
|---|---|
| 0 | Success, carry on; stdout is shown in transcript mode |
| 2 | Block; stderr is sent to Claude so it can adjust |
| Other | Non-blocking error; stderr is shown to you |

What exit 2 does per event: PreToolUse blocks the tool call; PostToolUse cannot undo, but feeds stderr to Claude; UserPromptSubmit rejects the prompt; Stop makes Claude keep working.

## Setup

    brew install jq
    chmod +x .claude/hooks/*.sh

## Test a hook by hand

    echo '{"tool_name":"Bash","tool_input":{"command":"rm -rf /"}}' | .claude/hooks/block-dangerous-bash.sh; echo "exit=$?"

Expected: a BLOCKED message and exit=2.

## Safety

Hooks run with your user's permissions, automatically. Review every hook script before you trust a repo.