# Portability

This catalogue treats **Markdown instructions** as the portable core. Vendor-specific features are optional overlays.

## Design principles

1. **Plain files** — Skills are directories you can copy, symlink, git-submodule, or package.
2. **Stable entrypoint** — `SKILL.md` is always the file the agent reads first.
3. **Manifest for machines** — `skill.manifest.yaml` powers validation, search, and future installers.
4. **Progressive disclosure** — Keep `SKILL.md` short; link to `reference.md` for depth.
5. **Explicit platform gaps** — If a skill needs MCP, browser, or terminal, say so in the manifest and body.

## Canonical skill package

```text
my-skill/
├── skill.manifest.yaml
├── SKILL.md
├── reference.md          # optional
├── examples.md           # optional
└── platform-notes.md     # optional — vendor quirks
```

## Frontmatter (minimum)

```yaml
---
name: my-skill
description: What it does and when to use it (third person).
---
```

Optional fields tools may respect:

| Field | Purpose |
|-------|---------|
| `disable-model-invocation` | When `true`, skill loads only when user/tool names it |
| `license` | SPDX id if different from repo MIT |
| `metadata.author` | Attribution |

## What to avoid in portable skills

- Hard-coded absolute paths (`/Users/foo/...`)
- Windows-only path separators
- Undocumented dependency on one IDE's proprietary config
- Secrets, API keys, or private URLs
- Instructions that expire on a specific date without a "legacy" section

## Distribution patterns

| Pattern | Use when |
|---------|----------|
| **Copy** | You want a frozen snapshot in the project |
| **Symlink** | You develop skills locally and test across repos |
| **Git submodule** | Teams pin a catalogue revision |
| **Package** | Future: npm/pip package that installs to known paths |

## Versioning

- **Repo** — Semantic versioning on releases (optional).
- **Skill** — `version` in `skill.manifest.yaml` (semver per skill).
- Breaking changes to a skill: bump minor/major and note in PR.

## Mapping to custom GPTs / chat UIs

Tools without a skills folder can still use catalogue content:

1. Paste `SKILL.md` body into system or custom instructions.
2. Upload `reference.md` as a knowledge file.
3. Link to the raw GitHub URL for updates.

Document your approach in `platform-notes.md` when you contribute an adapter.
