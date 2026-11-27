---
description: Write and run pytest tests via the pytest-tester subagent
argument-hint: [module or feature]
allowed-tools: Bash(uv run pytest:*), Bash(git diff:*)
---

Test this in python-app: $ARGUMENTS
If nothing was given, test what changed:
!`git diff --name-only`

Delegate to pytest-tester, then report tests added, passed, failed and why.
Do not change app/ code; report bugs instead.