# Code review reference

## Security quick scan

- User input reaches queries, shell, HTML, or paths without validation
- Authz checked on every mutating endpoint
- Secrets not in logs, errors, or client bundles
- Dependencies with known CVEs (flag for human verification)

## Performance smells

- Queries inside loops
- Loading full collections when pagination exists
- Synchronous I/O on request path without timeout

## Test quality

- Prefer testing behavior via public API
- One logical assertion theme per test
- Flaky patterns: fixed `sleep`, wall-clock dependence, shared mutable state
