# Supported platforms

Install paths change between tools. This table is the source of truth for `skill.manifest.yaml` `platforms.*.install.target` values.

| Platform | Project scope | User scope | Notes |
|----------|---------------|------------|-------|
| **Cursor** | `.cursor/skills/<id>/` | `~/.cursor/skills/<id>/` | `SKILL.md` + frontmatter; agent discovers via description |
| **Claude Code** | `.claude/skills/<id>/` | `~/.claude/skills/<id>/` | Same layout as Cursor |
| **Windsurf** | `.windsurf/skills/` or rules (check version) | varies | Copy `SKILL.md`; confirm current docs |
| **Cline** | `.cline/` rules or workspace instructions | — | Often uses rules markdown; paste or symlink |
| **Continue** | `.continue/rules/` or config | — | Map `SKILL.md` to a rule file |
| **GitHub Copilot** | `.github/copilot-instructions.md` | — | Merge skill sections; no per-skill folder yet |
| **OpenAI Codex / CLI** | `AGENTS.md` or project instructions | — | Reference skill by path in monorepos |
| **Custom GPT / ChatGPT** | — | UI only | Paste body + upload references |

> Paths evolve. If you find a correction, open a PR updating this file and the affected `skill.manifest.yaml` files.

## Install examples

### Cursor (project)

```bash
SKILL=code-review
cp -r "skills/engineering/$SKILL" ".cursor/skills/$SKILL"
```

### Claude Code (user)

```bash
cp -r skills/productivity/meeting-notes ~/.claude/skills/meeting-notes
```

### Symlink (development)

```bash
ln -sf "$(pwd)/skills/engineering/code-review" .cursor/skills/code-review
```

## Capability matrix

| Capability | Cursor | Claude Code | Chat-only |
|------------|--------|-------------|-----------|
| File read/write | Yes | Yes | No |
| Terminal | Yes | Yes | No |
| MCP tools | Yes | Yes | Rare |
| Auto skill discovery | Yes | Yes | Manual paste |

Skills that **require** terminal or MCP should state requirements in `SKILL.md` and `skill.manifest.yaml` tags (e.g. `requires-terminal`).

## Contributing a platform

1. Add a row to the table above with verified paths.
2. Add a `platforms.<name>` block to at least one example skill manifest.
3. Optional: `docs/platforms/<name>.md` with screenshots or CLI flags.
