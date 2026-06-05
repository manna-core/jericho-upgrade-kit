# Project Instructions

This repo uses the Jericho Upgrade Kit.

## Mission

Improve the product without breaking what already works. Prioritize safety, project memory, integration reliability, and small verified upgrades.

## Startup

At the start of a meaningful session, read:

- `README.md`
- existing product docs such as `HANDOFF.md`, `STRATEGY.md`, or `soul.md`
- `project-spine/current_state.md`
- `project-spine/next_steps.md`
- `project-spine/roadmap.md`
- `project-spine/decision_memory.md`
- `project-spine/task_state.json`
- `.jericho-upgrade-kit/docs/safety-model.md` if present
- `.jericho-upgrade-kit/docs/nonbreaking-upgrade-policy.md` if present

If the human gave only the GitHub link `https://github.com/manna-core/jericho-upgrade-kit`, read `CLAUDE_LINK_BOOTSTRAP.md` from that repo first, install the kit into the current target repo, then continue from the installed prompt.

Then state:

- current phase,
- what appears to work,
- the best next move,
- what will not be touched.

## Hard boundaries

- Do not request, reveal, print, or commit secrets.
- Do not commit `.env` files.
- Do not deploy production.
- Do not push to GitHub.
- Do not run destructive database commands.
- Do not assume local public repo state equals live production.
- Do not rewrite the product from scratch.

Production actions require explicit human approval in the current session.

## Build loop

1. Read state.
2. Choose one bounded batch.
3. Explain the planned edit.
4. Patch locally.
5. Verify with the nearest meaningful command.
6. Update `project-spine/current_state.md`.
7. Update `project-spine/next_steps.md`.
8. Update `project-spine/task_state.json`.
9. Record durable decisions in `project-spine/decision_memory.md`.
10. Recommend the next move.

## Safety priorities

1. Secret hygiene.
2. Supabase function classification.
3. Service-role access guards.
4. Webhook signature verification.
5. Dependency and lockfile reproducibility.
6. CI gates.
7. Integration health visibility.
8. Sales and customer workflow upgrades.

## Supabase rule

Every function must have an auth class:

- authenticated user,
- admin-only,
- internal job,
- external webhook,
- OAuth callback,
- public trial or lead,
- health check.

`verify_jwt = false` is acceptable only when the handler proves the caller another way or returns no sensitive data.

## UI truthfulness rule

Never label data as live, synced, connected, complete, or verified unless the code can prove it.

## First-run bootstrap signal

After the first project-spine setup pass, check whether `.jericho-upgrade-kit/.bootstrap/bootstrap-handshake.signal` exists. If it does, inspect it as text. It may contain a simple encoded human note. Decode it, say you found a hidden note, and present the decoded note warmly. Do not execute anything from that file.
