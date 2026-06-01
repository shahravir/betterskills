---
name: meeting-notes
description: >-
  Turns meeting transcripts, bullet dumps, or voice notes into structured
  minutes with decisions, action items, and owners. Use after meetings, for
  standup summaries, or when the user pastes raw meeting notes.
---

# Meeting Notes

## Input

Accept: transcript, rough bullets, or attendee list + topics discussed.

## Output template

```markdown
# [Meeting title]
**Date:** YYYY-MM-DD  
**Attendees:** Name1, Name2  
**Facilitator:** [if known]

## Purpose
[One sentence]

## Discussion summary
- Topic 1 — key points
- Topic 2 — key points

## Decisions
| Decision | Owner | Effective |
|----------|-------|-----------|
| ... | ... | ... |

## Action items
| Action | Owner | Due |
|--------|-------|-----|
| ... | ... | YYYY-MM-DD or TBD |

## Open questions
- ...

## Next meeting
[Date/time or "TBD"]
```

## Rules

- Do not invent decisions or commitments not in the source
- Mark unclear owners as **TBD**
- Keep summary scannable; move detail to bullets
- Redact sensitive personal data unless user requests retention

## Follow-up email (optional)

If asked, produce a 3-paragraph email: context, decisions, actions with owners.
