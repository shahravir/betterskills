---
name: conventional-commits
description: >-
  Drafts Conventional Commits messages from staged or unstaged diffs. Use when
  the user asks for a commit message, conventional commit, or help summarizing
  git changes before commit.
---

# Conventional Commits

## Format

```
<type>(<optional scope>): <subject>

<optional body>

<optional footer(s)>
```

- **Subject**: imperative mood, ≤72 chars, no trailing period
- **Body**: explain *why*, not only *what*
- **Breaking**: `BREAKING CHANGE: description` in footer or `type!:`

## Types

| Type | Use |
|------|-----|
| `feat` | New user-facing capability |
| `fix` | Bug fix |
| `docs` | Documentation only |
| `style` | Formatting, no logic change |
| `refactor` | Code change, no feat/fix |
| `perf` | Performance improvement |
| `test` | Tests only |
| `build` | Build system or deps |
| `ci` | CI config |
| `chore` | Maintenance, tooling |

## Workflow

1. Run `git status` and `git diff` (staged + unstaged).
2. Group changes into one or more logical commits if needed.
3. Pick type and scope from the diff paths.
4. Write subject from the *user impact*, not file names.

## Examples

**Input**: Added JWT login endpoint and middleware

```
feat(auth): add JWT login and validation middleware

Enable stateless sessions for API clients.
```

**Input**: Fixed timezone bug in report dates

```
fix(reports): use UTC for report timestamps

Fixes incorrect local display for cross-region users.
```

## Rules

- Do not mention tool names in the subject
- Avoid vague subjects: "update stuff", "fix bug"
- One concern per commit when possible
