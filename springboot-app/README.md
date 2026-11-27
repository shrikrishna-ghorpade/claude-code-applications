# springboot-app

Sample Spring Boot 3 + Maven REST app, set up to show every Claude Code configuration piece.

## Run it

    ./mvnw spring-boot:run     # http://localhost:8080
    ./mvnw test

## Folder structure

```text
springboot-app/
├── README.md                     <- this file
├── CLAUDE.md                     <- project memory (checked in)
├── CLAUDE.local.md               <- personal memory (gitignored)
├── .mcp.json                     <- project MCP servers (checked in)
├── .gitignore
├── pom.xml
├── src/
│   ├── main/java/com/example/demo/
│   │   ├── DemoApplication.java
│   │   ├── controller/
│   │   ├── service/
│   │   └── repository/
│   ├── main/resources/application.yml
│   └── test/java/com/example/demo/
└── .claude/
    ├── settings.json             <- permissions + hook definitions
    ├── settings.local.json       <- personal overrides (gitignored)
    ├── hooks/
    │   ├── block-dangerous-bash.sh   <- run by a PreToolUse hook
    │   └── format-java.sh            <- run by a PostToolUse hook
    ├── skills/
    │   └── spring-rest-endpoint/SKILL.md
    ├── commands/
    │   ├── develop.md            <- /develop
    │   └── test.md               <- /test
    └── agents/
        ├── backend-developer.md
        ├── database-developer.md
        ├── api-tester.md
        └── junit-tester.md
```

## What each Claude Code piece does here

| File | Type | Loaded when | Exam point |
|---|---|---|---|
| CLAUDE.md | Project memory | Session start | Guidance only, not enforcement |
| CLAUDE.local.md | Personal memory | Session start | Gitignored; your own notes |
| .mcp.json | MCP config | Session start | Team-shared servers; tools named mcp__server__tool |
| .claude/settings.json | Settings | Session start | Permissions + hooks = real enforcement |
| .claude/settings.local.json | Settings | Session start | Overrides settings.json |
| hooks/*.sh | Hook scripts | On the hook's event | Exit 2 blocks the action |
| skills/*/SKILL.md | Agent Skill | When its description matches the task | Only name + description load up front |
| commands/*.md | Slash command | When you type /name | $ARGUMENTS passes your input |
| agents/*.md | Subagent | When the main session delegates | Own context; flat, cannot call other subagents |

## How work flows

1. You type /develop add a GET /products endpoint.
2. The main session (the coordinator) reads CLAUDE.md and the command.
3. It delegates code to backend-developer, schema work to database-developer.
4. The PreToolUse hook checks every Bash command; the PostToolUse hook formats edited Java files.
5. /test hands tests to junit-tester and api-tester, then the main session summarises.

## Exam reminders

- Must always happen or never happen: use a hook or a deny rule, not CLAUDE.md.
- Repeatable know-how Claude should pick up by itself: a skill.
- A prompt you trigger by hand: a slash command.
- A task that needs its own clean context or limited tools: a subagent.
- External system access (GitHub, a database): an MCP server.