# Build Loop

Use this at the start and end of each meaningful implementation session.

## Start

1. Read `CLAUDE.md`.
2. Read `project-spine/current_state.md`.
3. Read `project-spine/next_steps.md`.
4. Read `project-spine/decision_memory.md`.
5. Check git status.
6. State the active phase and best next move.

## Implement

1. Choose one bounded batch.
2. Explain the intended change.
3. Patch locally.
4. Avoid unrelated refactors.
5. Preserve existing product behavior unless explicitly changing it.

## Verify

Run the closest relevant checks:

- install,
- build,
- targeted lint,
- tests,
- audit,
- secret scan,
- local smoke,
- UI check,
- release checklist.

## Close

1. Summarize what changed.
2. Record verification.
3. Update `current_state.md`.
4. Update `next_steps.md`.
5. Update `task_state.json`.
6. Add decisions or warnings to `decision_memory.md`.
7. Recommend the next move.

