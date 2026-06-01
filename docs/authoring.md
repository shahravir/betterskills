# Authoring skills

## Skill anatomy

Every skill answers:

1. **When** should the agent load this? → `description` + user triggers
2. **What** steps must it follow? → numbered workflow or checklist
3. **How** should output look? → templates and examples

## Description (most important field)

Write in **third person**. Include **capabilities** and **trigger phrases**.

```yaml
# Good
description: >-
  Reviews pull requests for correctness, security, and maintainability using
  a severity-tagged checklist. Use when reviewing PRs, diffs, or when the
  user asks for a code review.

# Weak
description: Helps with code.
```

## Body structure (recommended)

```markdown
# Title

## Quick start
3–5 bullet steps

## Workflow
Numbered steps or checklist

## Output format
Template the agent should follow

## Examples
One input → one output

## Additional resources
- [reference.md](reference.md)
```

## Kinds

| Kind | Audience | Examples |
|------|----------|----------|
| `engineering` | Developers | code review, API design |
| `non-engineering` | Everyone | email, meeting notes |
| `hybrid` | Technical + general | technical writing, spreadsheets |

## Size limits

- `SKILL.md`: aim for **< 200 lines**, hard limit **500**
- One level of linked files from `SKILL.md`
- Scripts only when they improve reliability (document deps)

## Testing a skill

1. Copy into your tool's skills directory.
2. Ask with an explicit trigger: *"Using the X skill, …"*
3. Ask without naming it — confirm description alone triggers (if auto-invoke is desired).
4. Run `./scripts/validate.sh`

## Anti-patterns

- Mega-skills that cover unrelated tasks
- Duplicating general knowledge the model already has
- Tool-specific jargon without a portable fallback
- Vague names: `helper`, `utils`, `misc`

See [CONTRIBUTING.md](../CONTRIBUTING.md) for the PR checklist.
