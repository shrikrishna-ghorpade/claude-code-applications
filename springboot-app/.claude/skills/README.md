# skills/

Agent Skills: packaged know-how that Claude picks up by itself when a task matches.

```text
skills/
├── README.md                      <- this file
└── spring-rest-endpoint/
    ├── SKILL.md                   <- required: frontmatter + instructions
    ├── templates/
    │   ├── Controller.java.tmpl   <- optional supporting files
    │   └── ControllerTest.java.tmpl
    └── scripts/
        └── check-endpoint.sh      <- optional script Claude can run
```

## How a skill loads (progressive disclosure)

1. Session start: only each skill's `name` and `description` go into context (cheap).
2. A task matches the description: Claude reads the full SKILL.md.
3. SKILL.md points to extra files: Claude reads or runs them only when needed.

So the description is the most important line: it decides when the skill is used.

## SKILL.md format

| Part | Required | Notes |
|---|---|---|
| name | Yes | Lowercase letters, numbers, hyphens; matches the folder name |
| description | Yes | What it does AND when to use it |
| allowed-tools | No | Limits which tools Claude may use while the skill is active |
| Body (markdown) | Yes | Step-by-step instructions, examples, links to supporting files |

## Where skills live

| Location | Scope |
|---|---|
| .claude/skills/ | This project, shared through git |
| ~/.claude/skills/ | You, in every project |
| Plugins | Installed with a plugin |

## Skill vs the others

- Skill: Claude decides to use it, from the description.
- Slash command: you trigger it by typing /name.
- CLAUDE.md: always loaded, every session.
- Subagent: a separate worker with its own context; it can be given skills too.