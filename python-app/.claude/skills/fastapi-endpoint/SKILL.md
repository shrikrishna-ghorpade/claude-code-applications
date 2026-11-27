---
name: fastapi-endpoint
description: Creates a new FastAPI endpoint in python-app with a router, service, Pydantic models and pytest tests. Use when the user asks to add, create or expose an API endpoint or route.
allowed-tools: Read, Grep, Glob, Edit, Write, Bash(uv run pytest:*)
---

# FastAPI endpoint

1. Add request and response models to app/models/<name>.py (Pydantic v2, BaseModel).
2. Add the service function in app/services/<name>.py; it takes the db session as a parameter.
3. Add the route in app/routers/<name>.py with APIRouter, response_model and the right status_code.
4. Register the router in app/main.py if it is new.
5. Add tests in tests/test_<name>.py using TestClient: happy path, 422 validation, 404.
6. Run uv run pytest and fix failures.

Rules: no SQLAlchemy objects in responses; raise HTTPException only in routers.