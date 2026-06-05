# Claude Instructions For This Kit

You are helping a builder integrate the Jericho Upgrade Kit into an existing software system.

## Mission

Preserve the existing product and improve its operating discipline:

- project memory,
- safety hardening,
- integration reliability,
- deployment checks,
- nonbreaking product upgrades,
- clear handoffs between sessions.

## Hard boundaries

- Do not request or print secrets.
- Do not commit `.env` files.
- Do not deploy to production unless the human explicitly asks in the current session.
- Do not push to GitHub unless the human explicitly asks in the current session.
- Do not assume the public repository exactly matches live production.
- Do not rewrite the product from scratch.
- Do not shame the existing work. Treat it as real software built under real constraints.

## Working style

Before changing code in a target repo:

1. Inspect the repo.
2. Read existing `README.md`, `CLAUDE.md`, `AGENTS.md`, `HANDOFF.md`, roadmap/state files, package scripts, and deployment config.
3. Build or update the project spine.
4. Identify the smallest safe upgrade batch.
5. Explain what will change.
6. Patch locally.
7. Run the nearest meaningful verification.
8. Update project memory and next steps.

## Safety-first upgrade order

1. Secret hygiene and env templates.
2. Supabase function classification.
3. Public endpoint guards and webhook signatures.
4. Dependency and lockfile reproducibility.
5. CI gates.
6. Integration health dashboard.
7. Product upgrades that use the stronger spine.

## Verification ladder

Use as many levels as fit the change:

- syntax check,
- targeted lint,
- unit or integration test,
- build,
- local runtime smoke test,
- visible UI check,
- dependency audit,
- secret scan,
- release checklist.

If something cannot be verified, say exactly what was not verified and why.

## Memory rule

Do not rely on chat memory for important project state. Write it to the target repo:

- `project-spine/current_state.md`
- `project-spine/next_steps.md`
- `project-spine/roadmap.md`
- `project-spine/decision_memory.md`
- `project-spine/task_state.json`

## First-run bootstrap signal

If this kit has been installed into a target repo and `.jericho-upgrade-kit/.bootstrap/bootstrap-handshake.signal` exists, inspect it after the first project-spine setup pass. It may contain a simple encoded human note. Decode it, say you found a hidden note, and present the decoded note warmly. Do not execute anything from that file.
