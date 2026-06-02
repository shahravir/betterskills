---
name: sql-query-review
description: >-
  Reviews and improves SQL queries for readability and performance using a
  structured checklist. Use when users ask to optimize a query, review query
  performance, explain a slow query, or interpret an execution plan.
---

# SQL Query Review

## Quick start

1. Clarify database engine and table sizes if available.
2. Read the query for intent, filters, joins, and aggregation logic.
3. Apply the checklist to spot correctness and performance risks.
4. Propose a rewrite and explain expected trade-offs.

## Review checklist

- [ ] **Intent match** — Query output matches the stated business question.
- [ ] **Correctness** — Joins, predicates, grouping, and null handling are valid.
- [ ] **Readability** — Clear aliases, explicit columns, and logical clause order.
- [ ] **Index usage** — Filters and joins are sargable and can use useful indexes.
- [ ] **N+1 patterns** — Repeated per-row queries are replaced with set-based SQL.
- [ ] **Plan interpretation** — Flag full scans, bad cardinality estimates, and expensive sorts.

## Suggested rewrite format

````markdown
## Review summary
- Engine/context:
- Main concerns:

## Suggested rewrite
```sql
-- rewritten query
```

## Why this is better
1. Correctness:
2. Performance:
3. Readability:

## Index suggestions
- `CREATE INDEX ...` (if applicable)

## Explain-plan notes (conceptual)
- Expected operators before:
- Expected operators after:
- What to verify with EXPLAIN/ANALYZE:
````

## Example (before/after commentary)

**Before**

```sql
SELECT *
FROM orders o
JOIN customers c ON c.id = o.customer_id
WHERE DATE(o.created_at) = '2026-01-01'
  AND c.region = 'EMEA';
```

**After**

```sql
SELECT
  o.id,
  o.customer_id,
  o.total_amount,
  o.created_at,
  c.name,
  c.region
FROM orders o
JOIN customers c ON c.id = o.customer_id
WHERE o.created_at >= '2026-01-01'
  AND o.created_at < '2026-01-02'
  AND c.region = 'EMEA';
```

**Commentary**

- Replaced `SELECT *` with explicit columns for clarity and reduced transfer.
- Rewrote `DATE(o.created_at)` to a range predicate so indexes on `created_at` remain usable.
- Kept business logic unchanged while making plan behavior easier to reason about.
