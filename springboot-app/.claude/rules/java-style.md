---
paths: src/main/**/*.java
---

# Java style rules

- Constructor injection only; fields are private final.
- DTOs are Java records; entities never leave the service layer.
- Use Optional for "may be missing" return values, never return null.
- Log with SLF4J (private static final Logger), never System.out.