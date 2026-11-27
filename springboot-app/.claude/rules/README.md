# rules/

Modular instructions: CLAUDE.md split into topic files.

```text
.claude/rules/
├── README.md       <- this file
├── security.md     <- no paths: loads every session
├── java-style.md   <- paths: src/main/**/*.java
└── testing.md      <- paths: src/test/**/*.java
```

## How rules load

| Frontmatter | When it loads |
|---|---|
| No paths field | Every session at launch, like CLAUDE.md |
| paths: <globs> | Only when Claude works on a file matching a glob |

- The frontmatter has one field, paths; it is optional.
- paths takes one glob or a YAML list of globs.
- Subfolders are allowed, e.g. rules/frontend/react.md.
- User-level rules go in ~/.claude/rules/.

## Rule vs the others

| Use | When |
|---|---|
| CLAUDE.md | Short, project-wide basics |
| rules/*.md | Topic or path-specific guidance; keeps context small |
| Skill | A how-to procedure Claude picks by task |
| Hook / deny | Must be enforced, not just advised |

# Exam notes for rules
- No paths = loads every session; with paths = loads only for matching files.
- Path-scoped rules save context: Java test rules stay out while Claude edits production code.
- Rules are still guidance; enforcement stays with hooks and permissions.