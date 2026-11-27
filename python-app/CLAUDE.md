# python-app - project memory

## Stack
FastAPI, Pydantic v2, SQLAlchemy 2, SQLite locally. Python version: see pyproject.toml.
Package manager: uv (never pip install directly).

## Commands
- Install:    uv sync
- Run:        uv run uvicorn app.main:app --reload
- All tests:  uv run pytest
- One test:   uv run pytest tests/test_products.py::test_get_product
- Lint/format: uv run ruff check --fix . && uv run ruff format .

## Architecture
routers -> services -> db. Rules:
- Routers only handle HTTP and call services.
- Services hold logic; only services touch the database session.
- Request and response bodies are Pydantic models in app/models, never SQLAlchemy objects.

## Code style
- Type hints on every function; async def for endpoints.
- Dependencies through FastAPI Depends(), not globals.
- Every endpoint gets pytest tests using TestClient.

## Gotchas
- Never edit .venv/ or uv.lock by hand.
- Secrets come from environment variables via pydantic-settings, never hard-coded.

## Subagents in this app
python-developer, data-developer, pytest-tester.