# python-app

Sample FastAPI app with the same Claude Code setup as springboot-app, adapted for Python.
Concept details live in springboot-app's READMEs; this one shows what is different.

## Run it

    uv sync                          # install dependencies
    uv run uvicorn app.main:app --reload   # http://localhost:8000/docs
    uv run pytest

## Folder structure

```text
python-app/
├── README.md                 <- this file
├── CLAUDE.md                 <- project memory
├── CLAUDE.local.md           <- personal memory (gitignored)
├── .mcp.json                 <- MCP servers
├── .gitignore
├── pyproject.toml            <- dependencies + ruff + pytest config
├── app/
│   ├── main.py               <- FastAPI app
│   ├── routers/              <- HTTP endpoints
│   ├── services/             <- business logic
│   ├── models/               <- Pydantic schemas
│   └── db/                   <- SQLAlchemy models + session
├── tests/
└── .claude/
    ├── settings.json
    ├── settings.local.json   <- gitignored
    ├── hooks/
    │   ├── block-dangerous-bash.sh   <- PreToolUse (same idea as Spring Boot)
    │   └── ruff-format.sh            <- PostToolUse
    ├── skills/
    │   └── fastapi-endpoint/SKILL.md
    ├── commands/
    │   ├── develop.md
    │   └── test.md
    └── agents/
        ├── python-developer.md
        ├── data-developer.md
        └── pytest-tester.md
```

## Same as springboot-app

CLAUDE.local.md, .mcp.json format, settings.json structure, hook contract, skill and agent file formats, /develop and /test pattern.

## Different in python-app

| Piece | Spring Boot | Python |
|---|---|---|
| Build / test | ./mvnw test | uv run pytest |
| Formatter hook | Spotless | ruff format + ruff check --fix |
| Permissions | Bash(./mvnw ...) | Bash(uv run pytest:*), Bash(uv run ruff:*) |
| Skill | spring-rest-endpoint | fastapi-endpoint |
| Subagents | 2 developers + 2 testers | 2 developers + 1 tester (pytest covers unit and API) |

## Exam reminder

The Claude Code setup is language-independent: only commands, tool rules and prompts change.