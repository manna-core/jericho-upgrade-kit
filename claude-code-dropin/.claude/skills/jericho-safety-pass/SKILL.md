---
description: Inspect the repo for secret hygiene, Supabase function auth, service-role risks, webhook guards, dependency risk, and deploy readiness.
---

# Jericho Safety Pass

Perform a safety inventory before feature work.

## Rules

- Do not print secret values.
- Do not deploy.
- Do not push.
- Do not make destructive changes.
- Do not change auth flags until functions are classified.

## Inspect

- `.env`, `.env.*`, and `.gitignore` patterns.
- `.env.example`.
- `supabase/config.toml`.
- `supabase/functions/**`.
- server-only key usage.
- frontend references to service-role or secret-like values.
- webhook handlers.
- OAuth callbacks.
- package manager and lockfiles.
- CI workflows.

## Produce or update

- `project-spine/function_classification_matrix.md`
- `project-spine/current_state.md`
- `project-spine/next_steps.md`
- `project-spine/task_state.json`
- `project-spine/decision_memory.md` for durable warnings.

## Output

Findings first:

- critical,
- high,
- medium,
- low.

Then:

- safest first patch,
- verification command to run after that patch,
- what needs live access to confirm.

