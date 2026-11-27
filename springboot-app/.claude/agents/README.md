# agents/

Subagents: specialised workers the main session hands tasks to. Flat list: subagents cannot call other subagents.

```text
agents/
├── README.md               <- this file
├── backend-developer.md    <- controllers, services, DTOs
├── database-developer.md   <- entities, repositories, schema
├── api-tester.md           <- MockMvc HTTP tests
└── junit-tester.md         <- JUnit 5 + Mockito unit tests
```

## How a subagent works

1. The main session picks a subagent from its description (or you name it: "use the api-tester subagent").
2. The subagent starts with a fresh context: its own system prompt plus the task. It does not see the main conversation.
3. It works with only the tools it is given.
4. It returns one result to the main session, which carries on.

That keeps the main context clean: the subagent's file reads and test logs stay in its own window.

## File format

YAML frontmatter, then the system prompt in markdown.

| Field | Required | Purpose |
|---|---|---|
| name | Yes | Lowercase with hyphens |
| description | Yes | When to use it; "use proactively" encourages automatic use |
| tools | No | Comma-separated list; leave out to inherit all tools |
| model | No | sonnet, opus, haiku, or inherit |
| skills | No | Skills preloaded for this subagent |
| memory | No | Gives it its own MEMORY.md (user or project scope) |

## Where subagents live

| Location | Scope |
|---|---|
| .claude/agents/ | This project, shared through git; wins on a name clash |
| ~/.claude/agents/ | You, in every project |

Built-in ones also exist: general-purpose, Explore, Plan.
Manage them with /agents.

## Who coordinates

The main session. /develop and /test (in ../commands) script the hand-offs.