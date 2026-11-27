---
description: Write and run component tests via component-tester
argument-hint: [component or folder]
allowed-tools: Bash(npm test:*), Bash(npx vitest:*), Bash(git diff:*)
---

Test this in react-app: $ARGUMENTS
If nothing was given:
!`git diff --name-only`

Delegate to component-tester, then report tests added, passed, failed and why.