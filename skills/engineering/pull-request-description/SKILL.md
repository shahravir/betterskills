---
name: pull-request-description
description: >-
  Generates clear, structured pull request descriptions from branch diffs or commit
  lists. Creates summaries, change logs, test plans, breaking change notes, and related
  issue references. Use when the user asks for a PR description, needs to summarize
  changes for reviewers, or wants a test plan section for their PR.
---

# Pull Request Description Writer

## Quick start

1. Read the branch diff (`git diff main...HEAD`) or commit list (`git log main..HEAD --oneline`).
2. Identify the type of change: feature, bug fix, refactor, performance, docs, or breaking change.
3. Apply the output template below.
4. Fill each section. If a section has no content (e.g., no breaking changes), omit it — do not write "None" or filler text.

## Workflow

- [ ] Run `git diff main...HEAD --stat` to get file change overview.
- [ ] Run `git log main..HEAD --oneline` to get commit messages.
- [ ] Categorise each commit: feat, fix, refactor, perf, docs, chore, breaking.
- [ ] Infer the **motivation** — why this change matters, not just what it does.
- [ ] Identify any **breaking changes**: API signature changes, config format changes, removed features, behavioural changes users will notice.
- [ ] If tests exist, summarise them. If not, note what manual testing was done.
- [ ] Link related issues by scanning commit messages for `#NNN` or `closes #NNN`.

## Output format

```markdown
## Summary

[1-3 sentences: what this PR does and why. Write for a reviewer who has no context.]

## Changes

- **[Category]** Brief description of change
  - Why this approach (if not obvious)

## Test plan

- [ ] Automated: [describe tests that exist or were added]
- [ ] Manual: [steps a reviewer should test, or "N/A — covered by CI"]

## Screenshots (if UI changes)

| Before | After |
|--------|-------|
| [image] | [image] |

## Breaking changes

- [List items only if there are breaking changes. Remove entire section if none.]

## Related issues

- Closes #NNN
- Related to #NNN
```

## Commit message → PR section mapping

| Commit prefix | PR section |
|---------------|------------|
| `feat:` / `add` | Changes (feature) |
| `fix:` / `bug` | Changes (bug fix) |
| `refactor:` | Changes (refactor) |
| `perf:` | Changes (performance) |
| `docs:` | Changes (documentation) |
| `chore:` | Omit from Changes unless reviewer-relevant |
| `BREAKING CHANGE:` | Breaking changes |
| `closes #NNN` | Related issues |

## Examples

**Input (messy commits):**
```
fix stuff
WIP
actually fix it this time
feat: add export to CSV
fix: handle empty result set
update readme
BREAKING CHANGE: CSV endpoint returns array instead of object
closes #42
```

**Output:**
```markdown
## Summary

Adds CSV export to the reporting API and fixes a crash when query results are empty.
The CSV endpoint response format changed — see Breaking changes.

## Changes

- **Feature** Add CSV export endpoint (`GET /api/reports/export?format=csv`)
  - Uses streaming response for large datasets
- **Bug fix** Handle empty result sets without 500 error
- **Docs** Update README with CSV export usage

## Test plan

- [x] Automated: Added `test_csv_export`, `test_csv_export_empty`, `test_csv_export_streaming`
- [ ] Manual: Verify CSV opens correctly in Excel and Google Sheets

## Breaking changes

- `GET /api/reports/export?format=csv` returns `[{...}, {...}]` (array) instead of `{"data": [{...}]}` (object with wrapper). Update any CSV parsing code to expect a top-level array.

## Related issues

- Closes #42
```

## Tips

- If commit messages are meaningless ("fix", "WIP", "."), ignore them. Describe changes by reading the diff directly.
- Keep Summary under 3 sentences. Reviewers skim; they need the point fast.
- Put the most impactful change first in the Changes list.
- For UI changes, screenshots are not optional — add `<!-- TODO: add screenshots -->` if the author hasn't provided them yet.
- If the PR touches >10 files, add a "Files changed" note at the end: `**Files:** 12 changed, +340 −120`.
