# 10 - Nonbreaking Upgrade Review

```text
Review the current diff before handoff.

Read:
- git diff,
- current_state.md,
- next_steps.md,
- decision_memory.md,
- deployment_checklist.md,
- function_classification_matrix.md if relevant.

Review for:
- behavior regressions,
- broken auth flow,
- accidental public exposure,
- secret leaks,
- stale status labels,
- missing env docs,
- missing verification,
- changes too large for one batch,
- deployment risk.

Output:
1. Findings first, ordered by severity, with file references.
2. Required fixes before merge.
3. What was verified.
4. What remains unverified.
5. Safe next move.

If there are no issues, say so clearly and still list residual risk.
```

