---
description: Run a pre-release review for Jericho changes before production deploy or handoff.
---

# Jericho Release Check

Use before deploy, merge, or handoff.

## Read

- git status,
- git diff,
- package scripts,
- deployment config,
- `project-spine/deployment_checklist.md`,
- `project-spine/current_state.md`,
- `project-spine/next_steps.md`,
- `project-spine/function_classification_matrix.md` if relevant.

## Check

- intended files changed only,
- no `.env` or secrets staged,
- env vars documented,
- build passes or blocker recorded,
- targeted lint/test passes or blocker recorded,
- dependency audit reviewed,
- function auth changes reviewed,
- rollback path known,
- state files updated.

## Output

Findings first, ordered by severity.

Then:

- deploy readiness: yes/no,
- verified commands,
- not verified,
- required fixes,
- rollback note,
- next move.

Do not deploy unless the human explicitly asks in the current session.

