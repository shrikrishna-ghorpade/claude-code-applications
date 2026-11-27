---
description: Plan and build a feature by delegating to the developer subagents
argument-hint: <feature description>
---

Build this feature in springboot-app: $ARGUMENTS

Current branch and changes:
!`git status --short`

Follow @CLAUDE.md. Work in this order:

1. Plan: list the endpoints, entities and tables needed. Show the plan and wait for my OK.
2. If tables or entities change, delegate to the database-developer subagent.
3. Delegate controllers, services and DTOs to the backend-developer subagent.
   It should use the spring-rest-endpoint skill.
4. Run ./mvnw test.
5. Summarise: files changed, tests run, anything left to do.

Do not commit.