---
name: spreadsheet-analysis
description: >-
  Analyzes tabular data in CSV, Excel, or pasted tables with summary stats,
  trends, and chart recommendations. Use for spreadsheet analysis, data
  exploration, pivot suggestions, or .xlsx and .csv files.
---

# Spreadsheet Analysis

## Workflow

1. **Profile** — rows, columns, dtypes, null %, duplicates
2. **Clean** — document assumptions (drops, fills, parsing)
3. **Analyze** — aggregates, trends, outliers
4. **Recommend** — charts and next questions

## Profiling output

```markdown
## Dataset profile
- Rows / columns:
- Key columns:
- Missing values:
- Duplicates:
- Date range (if applicable):

## Column summary
| Column | Type | Null% | Notes |
|--------|------|-------|-------|
```

## Analysis patterns

| Question type | Approach |
|---------------|----------|
| Comparison | Group by category, mean/median/count |
| Trend | Time series, period-over-period |
| Distribution | Histogram bins, percentiles |
| Correlation | Note strength; do not imply causation |

## Tool preference

When code is needed:

- **Python**: pandas for exploration; mention `openpyxl` for xlsx
- **SQL**: if data already in a warehouse

Show reproducible snippets, not one-off opaque steps.

## Visualization suggestions

| Data shape | Chart |
|------------|-------|
| Category vs value | Bar |
| Time vs value | Line |
| Part-to-whole | Stacked bar or treemap (sparingly) |
| Two numeric | Scatter |

## Rules

- State limitations of sample size
- Flag PII columns; avoid echoing sensitive values in summaries
- Prefer aggregated outputs over dumping raw rows
