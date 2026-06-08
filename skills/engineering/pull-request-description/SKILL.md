---
name: pull-request-description
description: >-
  Turns a branch diff, commit list, or change summary into a clear pull request
  description with summary, motivation, test plan, and breaking changes. Use when
  the user asks to write a PR description, summarize a diff for reviewers, or
  generate a test plan section for a pull request.
---

# Pull Request Description Writer

## Quick start

1. Gather context: `git log`, `git diff` against the base branch, and any linked issues.
2. Infer the user-facing goal — not just file names or commit subjects.
3. Group changes into themes (feature, fix, refactor, docs, etc.).
4. Fill the output template; omit sections that do not apply.

## Workflow

1. **Identify base branch** — Usually `main` or `master`; confirm if unclear.
2. **Read commits** — `git log <base>...HEAD --oneline` for narrative arc.
3. **Read the diff** — `git diff <base>...HEAD` for concrete behavior changes.
4. **Extract motivation** — Why now? What problem does this solve?
5. **Draft test plan** — Concrete steps a reviewer can follow.
6. **Flag breaking changes** — API removals, migrations, config changes, env vars.
7. **Link issues** — `Fixes #123`, `Relates to #456`, or manual references.

## Output format

```markdown
## Summary
[1–3 sentences: what changed and why it matters to users or reviewers]

## Changes
- [Themed bullet: user-visible or architectural change]
- [Another grouped change]

## Test plan
- [ ] [Concrete step a reviewer can run]
- [ ] [Edge case or regression check]

## Screenshots
[Optional — UI changes only; omit section if not applicable]

## Breaking changes
[Optional — omit section if none]
- [What broke, who is affected, migration steps]

## Related issues
Fixes #NNN
```

## Writing rules

- **Summary** — Lead with outcome, not implementation ("Add rate limiting" not "Update middleware file").
- **Changes** — Group by theme; avoid one bullet per commit unless commits are unrelated.
- **Test plan** — Checkboxes with verifiable steps; mention commands, URLs, or fixtures.
- **Breaking changes** — Be explicit about upgrade paths and defaults.
- **Tone** — Professional, concise; no filler ("This PR updates some files").

## Example

**Input** — Commits on branch `feat/auth-jwt`:

```
a1b2c3d fix typo in login handler
d4e5f6g add jwt middleware
g7h8i9j update readme
j0k1l2m wip tests
```

**Diff highlights** — New `POST /login`, JWT validation middleware, removed session cookies.

**Output**

```markdown
## Summary
Add JWT-based authentication for API clients, replacing cookie sessions on
public API routes. Enables stateless integration for mobile and third-party apps.

## Changes
- Add `POST /login` endpoint issuing signed JWT access tokens
- Add JWT validation middleware for protected routes
- Remove session-cookie auth from API handlers (web UI unchanged)
- Document auth flow and token refresh in README

## Test plan
- [ ] `curl -X POST /login` with valid credentials returns a JWT
- [ ] Protected route returns 401 without token, 200 with valid token
- [ ] Expired token returns 401 with clear error message
- [ ] Existing web session login still works in browser

## Breaking changes
- API clients using session cookies must switch to JWT bearer tokens
- `Authorization: Bearer <token>` header is now required on protected API routes

## Related issues
Fixes #42
```
