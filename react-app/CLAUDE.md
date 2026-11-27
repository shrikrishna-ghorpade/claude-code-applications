# react-app - project memory

## Stack
React 18, Vite, TypeScript (strict), Vitest + React Testing Library. Versions: see package.json.

## Commands
- Dev:   npm run dev
- Test:  npm test        (one file: npx vitest run src/components/Button.test.tsx)
- Lint:  npm run lint
- Build: npm run build

## Conventions
- Function components and hooks only; no class components.
- One component per file, PascalCase names; co-locate Component.test.tsx.
- Props typed with an interface; no any.
- API calls only in src/api; components never call fetch directly.
- Accessible by default: semantic HTML, labels on inputs, alt on images.

## Gotchas
- Never edit dist/ or node_modules/.
- API base URL comes from import.meta.env.VITE_API_URL.

## Subagents in this app
frontend-developer, ui-reviewer, component-tester.