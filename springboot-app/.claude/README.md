# .claude folder

Everything here configures how Claude Code behaves in springboot-app.

```text
.claude/
├── README.md             <- this file
├── settings.json         <- shared: permissions, env, hooks (checked in)
├── settings.local.json   <- personal overrides (gitignored)
├── hooks/                <- scripts that hooks in settings.json call
├── skills/               <- Agent Skills
├── commands/             <- custom slash commands
└── agents/               <- subagents
```

## settings.json at a glance

It has three top-level sections:

| Section | Purpose |
|---|---|
| permissions | What Claude may do: allow, ask or deny |
| env | Environment variables set for every session |
| hooks | Shell commands that run on events, e.g. before a tool runs |

## Permissions

| List | Behaviour | Examples in this app |
|---|---|---|
| deny | Never allowed; checked first and always wins | .env files, target/, rm -rf, WebFetch |
| ask | Claude must ask you each time | git commit, git push, editing pom.xml |
| allow | Runs without asking | ./mvnw test, ./mvnw clean package, edits in src/ |

Rule syntax: `Tool` or `Tool(pattern)`.

- `Bash(./mvnw test:*)` matches any command starting with `./mvnw test`.
- `Read(src/**)` uses gitignore-style globs.
- `mcp__github__create_issue` targets one MCP tool; `mcp__github` targets the whole server.

`defaultMode` sets the starting mode: default (ask as rules say), acceptEdits (file edits allowed), plan (read-only planning), bypassPermissions (no prompts; avoid).

## Hooks

A hook = an event + an optional matcher + a command.

| Event | Runs | Matcher? | Used here for |
|---|---|---|---|
| PreToolUse | Before a tool runs; can block it | Yes | Checking Bash commands |
| PostToolUse | After a tool succeeds | Yes | Formatting edited Java files |
| SessionStart | When a session opens | No | Printing a test reminder |
| UserPromptSubmit | When you send a prompt | No | Not used |
| Stop / SubagentStop | When Claude or a subagent finishes | No | Not used |
| Notification, PreCompact, SessionEnd | Other lifecycle points | No | Not used |

How a hook script talks back:

- It receives the event as JSON on stdin (tool name, tool input, session id).
- Exit 0: carry on. Exit 2: block; stderr is shown to Claude. Any other code: a non-blocking error.
- It can also print JSON to stdout for finer control, e.g. a permission decision.
- `$CLAUDE_PROJECT_DIR` points to the project root, so script paths always resolve.

## Other folders (details in each folder's README.md)

| Folder | What it holds | How it is used | Exam point |
|---|---|---|---|
| hooks/ | Scripts that hooks in settings.json call | Run on their event | The script does nothing unless settings.json references it |
| skills/<name>/SKILL.md | Know-how plus optional scripts and templates | Claude loads it when the task matches its description | Only name and description sit in context until it is needed |
| commands/<name>.md | A saved prompt | You type /name, input arrives as $ARGUMENTS | Triggered by you, not chosen by Claude |
| agents/<name>.md | A subagent: description, tools, model, system prompt | The main session delegates a task to it | Own context window; cannot call other subagents |

Quick choice:

- Must always or never happen: hook or deny rule.
- Reusable expertise Claude should pick up by itself: skill.
- A workflow you start by hand: slash command.
- A focused task needing a clean context or limited tools: subagent.

## Which file wins

Highest first: enterprise managed settings, command-line flags, settings.local.json, settings.json, ~/.claude/settings.json.
Permission lists from all levels are combined, and a deny anywhere still wins.

## Check what is loaded

- /permissions: view and edit the rules.
- /hooks: view and edit the hooks.
- /status: see which settings files are active.