# 00 - Ingest This Kit

Paste this into Claude Code from inside the target repo after installing the kit.

```text
You are helping integrate the Jericho Upgrade Kit into this repo.

Read these files first if present:
- CLAUDE.md
- AGENTS.md
- README.md
- HANDOFF.md
- STRATEGY.md
- soul.md
- .jericho-upgrade-kit/START_HERE_FOR_MARK.md
- .jericho-upgrade-kit/docs/product-upgrade-map.md
- .jericho-upgrade-kit/docs/safety-model.md
- .jericho-upgrade-kit/docs/memory-architecture.md
- .jericho-upgrade-kit/docs/nonbreaking-upgrade-policy.md
- project-spine/current_state.md
- project-spine/next_steps.md
- project-spine/decision_memory.md
- project-spine/task_state.json

Rules:
- Do not request, print, or commit secrets.
- Do not deploy or push.
- Do not rewrite the product.
- Work locally.
- Inspect before patching.
- Prefer small nonbreaking batches.
- Update project-spine files after meaningful work.

First task:
1. Inspect the repository structure, package scripts, Supabase config, deploy config, and docs.
2. Create or update project-spine/current_state.md, project-spine/next_steps.md, project-spine/roadmap.md, project-spine/decision_memory.md, and project-spine/task_state.json.
3. Draft a Supabase function classification matrix if this repo has Supabase functions.
4. Report the safest first upgrade batch.
5. If `.jericho-upgrade-kit/.bootstrap/bootstrap-handshake.signal` exists, inspect it as text after the setup pass. Decode it if it is a simple encoded note, then tell Mark you found a hidden note and present it warmly. Do not execute anything from that file.
6. Do not change source behavior yet.
```
