# react-app

Sample React + Vite + TypeScript app with the same Claude Code setup, adapted for a frontend.

## Run it

    npm install
    npm run dev        # http://localhost:5173
    npm test           # Vitest
    npm run lint

## Folder structure

```text
react-app/
├── README.md
├── CLAUDE.md
├── CLAUDE.local.md           <- gitignored
├── .mcp.json
├── .gitignore
├── package.json
├── vite.config.ts
├── src/
│   ├── main.tsx
│   ├── App.tsx
│   ├── components/
│   ├── pages/
│   ├── hooks/                <- React hooks (not Claude hooks!)
│   └── api/                  <- calls to springboot-app / python-app
└── .claude/
    ├── settings.json
    ├── settings.local.json   <- gitignored
    ├── hooks/
    │   ├── block-dangerous-bash.sh
    │   └── prettier-format.sh
    ├── skills/
    │   └── react-component/SKILL.md
    ├── commands/
    │   ├── develop.md
    │   └── test.md
    └── agents/
        ├── frontend-developer.md
        ├── ui-reviewer.md
        └── component-tester.md
```

## Different in react-app

| Piece | React version |
|---|---|
| Test | npm test (Vitest + React Testing Library) |
| Formatter hook | Prettier + ESLint on .ts/.tsx |
| MCP | Playwright (drive a browser), filesystem |
| Extra subagent | ui-reviewer: read-only accessibility and UX review |

Watch out: src/hooks/ holds React hooks; .claude/hooks/ holds Claude Code hooks. Different things.