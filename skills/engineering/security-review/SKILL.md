---
name: security-review
description: >-
  Performs a lightweight security review using OWASP-oriented checks for auth,
  input validation, secrets, and dependencies. Use for security review, threat
  check, or before merging sensitive changes.
---

# Security Review

## Scope

Focus on changed code and its trust boundaries (network, auth, data stores, third parties).

## Checklist

### Authentication & session

- [ ] Auth required on all non-public routes
- [ ] Session/token expiry and rotation considered
- [ ] Logout invalidates server-side session if applicable

### Authorization

- [ ] Object-level checks (user A cannot access user B's resource)
- [ ] Role checks on admin paths
- [ ] No security by obscurity

### Input & output

- [ ] Parameterized queries (no string-built SQL)
- [ ] Output encoded for context (HTML, URL, JS)
- [ ] File uploads: type, size, storage path validated
- [ ] SSRF protections on outbound fetches

### Secrets & crypto

- [ ] No secrets in repo, logs, or client code
- [ ] Passwords hashed with modern algorithm (argon2/bcrypt)
- [ ] TLS for data in transit

### Dependencies & config

- [ ] New dependencies justified; note supply-chain risk
- [ ] Debug endpoints disabled in production
- [ ] CORS not `*` with credentials

## Output format

```markdown
## Security review summary
Risk: [Low / Medium / High]

## Findings
| Severity | Location | Issue | Recommendation |
|----------|----------|-------|----------------|
| High | file:line | ... | ... |

## Residual risk
[What was not reviewed or needs pentest]
```

## Severity

- **High**: Exploitable without unlikely conditions
- **Medium**: Requires misconfiguration or chained issues
- **Low**: Defense-in-depth improvement

Do not claim compliance (SOC2, PCI) — flag for human auditors.
