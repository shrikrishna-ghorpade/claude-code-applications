---
name: react-component
description: Creates a typed, accessible React function component with a co-located Vitest + React Testing Library test. Use when the user asks to add, build or create a component, page or UI element.
allowed-tools: Read, Grep, Glob, Edit, Write, Bash(npx vitest:*)
---

# React component

1. Check src/components for an existing component to reuse or extend.
2. Create src/components/<Name>/<Name>.tsx:
   - export function <Name>(props: <Name>Props)
   - interface <Name>Props with every prop typed; no any.
3. Use semantic HTML (button, nav, label); add aria attributes only when HTML cannot express it.
4. Data from the backend goes through a function in src/api plus a custom hook in src/hooks.
5. Create <Name>.test.tsx next to it:
   - render, then query by role or label (getByRole), not by class name.
   - Simulate user actions with @testing-library/user-event.
6. Run npx vitest run src/components/<Name> and fix failures.