---
description: Plan and build a feature by delegating to the Python subagents
argument-hint: <feature description>
---

Build this feature in python-app: $ARGUMENTS

!`git status --short`

Follow @CLAUDE.md.
1. Plan the routes, models and tables. Show the plan and wait for my OK.
2. Database tables or SQLAlchemy models: delegate to data-developer.
3. Routers, services, Pydantic models: delegate to python-developer (fastapi-endpoint skill).
4. Run uv run pytest.
5. Summarise files changed and test results. Do not commit.