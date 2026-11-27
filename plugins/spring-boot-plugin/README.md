# spring-boot-plugin

Packages the Spring Boot skill, commands, agents and hooks so any Spring Boot project can install them in one step.

## Structure

```text
claude-code-applications/
├── .claude-plugin/
│   └── marketplace.json            <- File 61: lists the plugins in this repo
└── plugins/
    └── spring-boot-plugin/
        ├── README.md               <- this file
        ├── .claude-plugin/
        │   └── plugin.json         <- File 59: manifest (ONLY this file goes here)
        ├── skills/
        │   └── spring-rest-endpoint/SKILL.md   <- copy of File 13
        ├── commands/
        │   ├── develop.md          <- copy of File 15
        │   └── test.md             <- copy of File 16
        ├── agents/
        │   ├── backend-developer.md    <- File 18
        │   ├── database-developer.md   <- File 19
        │   ├── api-tester.md           <- File 20
        │   └── junit-tester.md         <- File 21
        ├── hooks/
        │   └── hooks.json          <- File 60: same format as settings.json "hooks"
        └── scripts/
            ├── block-dangerous-bash.sh <- File 10
            ├── format-java.sh          <- File 11
            └── tests-before-commit.sh  <- File 57
```

## Plugin vs .claude/ folder

| | .claude/ in a project | Plugin |
|---|---|---|
| Reaches | That one repo | Any project that installs it |
| Versioned | With the repo | Own version in plugin.json |
| Commands shown as | /develop | /spring-boot-plugin:develop |
| Hooks live in | settings.json | hooks/hooks.json |
| Script paths use | $CLAUDE_PROJECT_DIR | ${CLAUDE_PLUGIN_ROOT} |

## Try it

Test without installing:

    claude --plugin-dir ./plugins/spring-boot-plugin

Install from this repo as a marketplace (inside a session):

    /plugin marketplace add ./
    /plugin install spring-boot-plugin@claude-code-applications
    /plugin            <- manage, enable, disable

## Exam reminders

- Only plugin.json goes inside .claude-plugin/; everything else sits at the plugin root.
- A marketplace is just a repo with .claude-plugin/marketplace.json listing plugins.
- Hooks move from settings.json into hooks/hooks.json with the same format.
- Plugin hooks run with your permissions: install only plugins you trust.