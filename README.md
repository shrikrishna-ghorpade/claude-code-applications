# Claude Code Applications

Three sample apps, each showing every Claude Code configuration piece in its real format.

## Repo structure

claude-code-applications/
├── README.md                  <- this file
├── CLAUDE.md                  <- repo-wide memory/instructions
├── springboot-app/
├── python-app/
└── react-app/

Each app contains:

<app>/
├── CLAUDE.md                  <- project memory (checked in)
├── CLAUDE.local.md            <- personal memory (gitignored)
├── .mcp.json                  <- project MCP servers (checked in)
└── .claude/
    ├── settings.json          <- shared settings: permissions + hooks
    ├── settings.local.json    <- personal overrides (gitignored)
    ├── hooks/                 <- scripts called by hooks (hooks are DEFINED in settings.json)
    ├── skills/<name>/SKILL.md <- Agent Skills
    ├── commands/<name>.md     <- custom slash commands
    └── agents/<name>.md       <- subagents (flat: subagents cannot call other subagents)

## Concept cheat sheet

| Piece | Where | Purpose |
|---|---|---|
| CLAUDE.md | project root (also ~/.claude/CLAUDE.md for user-level) | Instructions loaded into every session |
| settings.json | .claude/ | Permissions (allow/ask/deny) and hooks |
| Hooks | "hooks" key in settings.json | Shell commands run on events like PreToolUse |
| MCP servers | .mcp.json | External tools Claude can call |
| Skills | .claude/skills/<name>/SKILL.md | Reusable expertise Claude loads when the description matches |
| Slash commands | .claude/commands/<name>.md | Prompts you trigger with /name |
| Subagents | .claude/agents/<name>.md | Specialised assistants with their own context and tools |

## What Claude Code offers by default

Names change between versions: check the official docs before the exam.

### Built-in tools (used in hook matchers and permission rules)

| Tool | What it does | Asks permission? |
|---|---|---|
| Read | Reads a file | No |
| Write | Creates or overwrites a file | Yes |
| Edit | Targeted edit inside a file | Yes |
| MultiEdit | Several edits to one file at once | Yes |
| NotebookEdit | Edits a Jupyter notebook cell | Yes |
| Glob | Finds files by pattern, e.g. **/*.java | No |
| Grep | Searches file contents | No |
| Bash | Runs a shell command | Yes |
| BashOutput / KillShell | Reads or stops a background shell | No |
| WebFetch | Fetches a URL | Yes |
| WebSearch | Searches the web | Yes |
| Task (Agent) | Launches a subagent | No |
| TodoWrite | Manages the session task list | No |
| SlashCommand | Lets Claude run a custom slash command | Yes |
| Skill | Loads an Agent Skill | No |
| ExitPlanMode | Leaves plan mode with a plan | Yes |

Matcher examples: "Bash", "Edit|Write", "mcp__github__.*", "*" for all.
Permission rule examples: Bash(npm run test:*), Read(./.env), Edit(src/**).

### Built-in subagents

| Subagent | Purpose |
|---|---|
| general-purpose | Multi-step research and tasks, all tools |
| Explore | Fast, read-only codebase search |
| Plan | Researches the code while in plan mode |

### MCP

No MCP servers are on by default: you add them in .mcp.json (project), ~/.claude.json (user) or with `claude mcp add`.
Their tools are named mcp__<server>__<tool>, e.g. mcp__github__create_issue.

### Built-in slash commands (common)

/init (generates CLAUDE.md), /memory, /mcp, /agents, /hooks, /permissions, /config, /model, /compact, /clear, /review, /cost, /help.

## Hook events

PreToolUse, PostToolUse, UserPromptSubmit, Notification, Stop, SubagentStop, PreCompact, SessionStart, SessionEnd.

Hook exit codes: 0 = success, 2 = block (stderr is shown to Claude), anything else = non-blocking error.

## Settings precedence (highest first)

1. Enterprise managed settings
2. Command-line arguments
3. .claude/settings.local.json
4. .claude/settings.json
5. ~/.claude/settings.json