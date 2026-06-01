---
name: technical-writing
description: >-
  Writes or revises technical documentation for clarity, structure, and audience
  fit. Use for READMEs, runbooks, API docs, tutorials, or when the user asks to
  improve technical writing.
---

# Technical Writing

## Audience first

| Audience | Emphasis |
|----------|----------|
| New user | Quick start, prerequisites, copy-paste examples |
| Daily user | How-to tasks, troubleshooting |
| Maintainer | Architecture, config, contribution |

## Document patterns

### README

```markdown
# Project name
One-line value proposition.

## Quick start
Minimal steps to success.

## Installation
## Usage
## Configuration
## Troubleshooting
## Contributing / License
```

### How-to guide

Goal → Prerequisites → Steps (numbered) → Verify → Next steps

### Reference

Tables, parameter lists, defaults, error codes — no narrative fluff

## Style rules

- Active voice, present tense
- Second person ("you") for instructions
- One idea per sentence; short paragraphs
- Code blocks complete and runnable where possible
- Headings form a logical outline (no skipped levels)

## Revision pass

1. Cut redundancy
2. Move advanced content lower or to linked page
3. Add missing prerequisites and failure modes
4. Check all commands and paths against the repo

## Output

When editing, show **before/after** only for changed sections unless full doc requested.
