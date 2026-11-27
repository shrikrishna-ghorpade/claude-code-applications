# commands/

Custom slash commands: saved prompts you run by typing /name.

```text
commands/
├── README.md     <- this file
├── develop.md    <- /develop <feature>
└── test.md       <- /test [scope]
```

## How a command works

1. The file name becomes the command: develop.md -> /develop.
2. Whatever you type after it arrives as $ARGUMENTS (or $1, $2 for separate words).
3. The body is sent as your prompt to the main session.

Subfolders namespace commands: commands/db/migrate.md -> /migrate, shown as (project:db).

## Frontmatter fields (all optional)

| Field | Purpose |
|---|---|
| description | Shown in the / menu |
| argument-hint | Hint shown after the name, e.g. <feature> |
| allowed-tools | Tools the command may use without asking |
| model | Run this command on a specific model |

## Special syntax in the body

| Syntax | Meaning |
|---|---|
| $ARGUMENTS | Everything typed after the command |
| $1, $2 | Individual arguments |
| @path | Include a file's contents |
| !`command` | Run a shell command first and include its output (needs Bash in allowed-tools) |

## Where commands live

| Location | Scope |
|---|---|
| .claude/commands/ | This project, shared through git |
| ~/.claude/commands/ | You, in every project |

## Command vs skill

You trigger a command. Claude chooses a skill by itself.
These two commands act as coordinators: they run in the main session, which is the only place that can hand work to subagents.