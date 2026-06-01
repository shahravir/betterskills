---
name: systematic-debugging
description: >-
  Debugs failures using reproduce-isolate-fix-verify steps instead of random
  changes. Use when fixing bugs, flaky tests, production errors, or when the
  user says something is broken and the cause is unclear.
disable-model-invocation: false
---

# Systematic Debugging

## Principles

1. **Reproduce** before fixing
2. **One change** at a time when testing hypotheses
3. **Evidence** over assumptions — read logs, stack traces, metrics
4. **Smallest fix** that addresses root cause, not symptoms

## Workflow

```
- [ ] 1. Define expected vs actual behavior
- [ ] 2. Reproduce reliably (note env, data, steps)
- [ ] 3. Gather evidence (logs, traces, minimal repro)
- [ ] 4. Form hypothesis (single sentence)
- [ ] 5. Test hypothesis (instrument or experiment)
- [ ] 6. Implement fix
- [ ] 7. Verify fix + regression test
- [ ] 8. Document cause if non-obvious
```

## Bisection

When regression timing is known:

- `git bisect` for code regressions
- Compare config/env between working and broken deploys

## Flaky tests

- Run with seed repetition (`--repeat`, loop N times)
- Check time, network, parallelism, shared state
- Prefer deterministic waits over `sleep`

## Output while debugging

Report after each major step:

```markdown
## Status
Reproduced: yes/no

## Evidence
- [log line, metric, stack snippet]

## Hypothesis
...

## Next step
...
```

## Anti-patterns

- Changing multiple unrelated things at once
- Fixing without a test when tests exist
- Masking errors with broad try/catch
