---
description: Write and run tests by delegating to the tester subagents
argument-hint: [class, package or feature]
allowed-tools: Bash(./mvnw test:*), Bash(git diff:*)
---

Test this in springboot-app: $ARGUMENTS
If nothing was given, test what changed:
!`git diff --name-only`

1. Delegate unit tests (JUnit 5 + Mockito, services and helpers) to the junit-tester subagent.
2. Delegate HTTP-level tests (MockMvc, status codes, JSON bodies) to the api-tester subagent.
3. Run ./mvnw test.
4. Report: tests added, passed, failed, and the cause of each failure.

Do not change production code; report bugs instead.