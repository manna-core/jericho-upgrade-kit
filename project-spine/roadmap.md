# Roadmap

This roadmap is a starting point. Claude should adapt it to the target repo after inspection.

## Phase 0: Safety and reproducibility

Goal: make the software safer to change before expanding it.

Deliverables:

- `.env.example` exists and `.env` is ignored.
- Function classification matrix exists.
- Dangerous public/admin functions are retired or gated.
- Build command passes from a clean install.
- Lockfile strategy is clear.
- CI runs install, build, lint budget, audit, and secret scan.
- Deployment checklist exists.

Exit criteria:

- A new builder can clone, install, build, and understand the safety boundaries.
- No known live public endpoint can read or write sensitive data without caller proof.

## Phase 1: Memory and project continuity

Goal: make every build session inherit the project context.

Deliverables:

- `CLAUDE.md` or `.claude/CLAUDE.md`.
- `project-spine/current_state.md`.
- `project-spine/next_steps.md`.
- `project-spine/decision_memory.md`.
- `project-spine/task_state.json`.
- Product soul and customer memory rules.
- Claude Code project skills.

Exit criteria:

- Claude can explain the product, phase, risks, next move, and verification path at session start.

## Phase 2: Integration reliability

Goal: make data freshness and integration status visible.

Deliverables:

- Integration inventory.
- Last-sync status per integration.
- Webhook signature status.
- Failure and retry logs.
- Manual retry where safe.
- Stale data labels in UI.

Exit criteria:

- A user can see what is fresh, stale, failed, or never connected.

## Phase 3: Revenue upgrades

Goal: turn the safer operating system into sales and customer value.

Deliverables:

- Sales operator cockpit.
- Customer/account memory brief.
- Pre-call plan.
- Follow-up drafter.
- Deal risk and next-best-action view.
- Executive weekly report.
- ROI dashboard.

Exit criteria:

- The product helps sell, onboard, retain, or expand customers in a measurable way.

