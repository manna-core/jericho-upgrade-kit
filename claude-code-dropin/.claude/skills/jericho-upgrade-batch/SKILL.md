---
description: Implement one small nonbreaking Jericho upgrade batch, verify it, and update the project spine.
argument-hint: [batch-goal]
---

# Jericho Upgrade Batch

Implement exactly one bounded upgrade batch.

Batch goal:

`$ARGUMENTS`

## Before editing

1. Read `CLAUDE.md`.
2. Read `project-spine/current_state.md`.
3. Read `project-spine/next_steps.md`.
4. Read `project-spine/decision_memory.md`.
5. Inspect relevant files.
6. State the planned changes and verification.

## Implementation rules

- Preserve existing behavior unless the batch explicitly changes it.
- Avoid unrelated refactors.
- Do not touch production.
- Do not push.
- Do not request or reveal secrets.
- Keep changes small enough to review.

## Verify

Run the nearest meaningful checks:

- targeted lint or type check,
- build,
- tests,
- audit,
- secret scan,
- local smoke.

If a check cannot run, record why.

## Close

Update:

- `project-spine/current_state.md`,
- `project-spine/next_steps.md`,
- `project-spine/task_state.json`,
- `project-spine/decision_memory.md` if a durable decision or warning emerged.

Report:

- changed files,
- verification,
- residual risk,
- next move.

