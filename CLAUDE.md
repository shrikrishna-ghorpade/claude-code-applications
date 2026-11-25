# Claude Code Applications - repo memory

## What this repo is
A monorepo of three sample apps that demonstrate Claude Code configuration:
- springboot-app/ : Java 21, Spring Boot 3, Maven
- python-app/     : Python 3.12, FastAPI, pytest
- react-app/      : React 18, Vite, TypeScript, Vitest

Each app has its own CLAUDE.md, .mcp.json and .claude/ folder. Read the app's CLAUDE.md before working inside it.

## Working rules (all apps)
- Stay inside the app folder you were asked to change; never edit another app as a side effect.
- Make small, focused changes and explain what you changed.
- Run the app's tests after every code change and report the result.
- Never commit secrets. .env files, keys and tokens stay out of git.
- Never run git push without being asked.

## Coordinating subagents
Subagents live flat in each app's .claude/agents/ folder and cannot call each other.
The main session coordinates:
1. Send implementation work to the developer subagent for that layer.
2. Send test writing and test runs to the matching tester subagent.
3. Collect their results and summarise them for the user.

## Git conventions
- Branches: feature/<short-name>, fix/<short-name>
- Commit messages: Conventional Commits, e.g. "feat(python-app): add health endpoint"

## Imports
CLAUDE.md files can pull in other files with @path, for example:
@README.md