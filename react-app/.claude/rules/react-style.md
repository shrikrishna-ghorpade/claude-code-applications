---
paths:
  - src/**/*.tsx
  - src/**/*.ts
---

# React style rules

- Function components only; one component per file, PascalCase names.
- Props typed with an interface; never use any.
- Custom hooks start with use and live in src/hooks.
- Tests query by role or label with React Testing Library, never by class name.