# 02 - Live Supabase Inventory

Use only after the human has granted live Supabase access through proper tools or dashboard exports. Do not ask them to paste secrets.

```text
Perform a live Supabase inventory without revealing secret values.

Allowed:
- list project refs/names,
- list deployed Edge Functions,
- compare deployed functions to repo functions,
- list secret names only,
- inspect logs for error classes without copying sensitive payloads,
- inspect RLS policy names and table names if access is available.

Not allowed:
- print secret values,
- dump customer rows,
- rotate secrets without explicit approval,
- deploy functions,
- run destructive SQL.

Update:
- project-spine/current_state.md
- project-spine/function_classification_matrix.md
- templates/ENVIRONMENT_VARIABLES.md or project-specific env register
- project-spine/next_steps.md

Report:
- functions in repo but not live,
- functions live but not in repo,
- public functions needing handler proof,
- missing secret names,
- highest-risk live endpoint,
- safest first live hardening step.
```

