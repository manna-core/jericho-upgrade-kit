---
description: Rebuild Jericho project context, read the operating spine, summarize current state, and recommend the next safe move.
---

# Jericho Start

Use at the beginning of a session.

## Read first

- `CLAUDE.md`
- `AGENTS.md` if present
- `README.md`
- `project-spine/current_state.md`
- `project-spine/next_steps.md`
- `project-spine/roadmap.md`
- `project-spine/decision_memory.md`
- `project-spine/task_state.json`
- `.jericho-upgrade-kit/docs/product-upgrade-map.md` if present
- `.jericho-upgrade-kit/docs/safety-model.md` if present
- `.jericho-upgrade-kit/docs/nonbreaking-upgrade-policy.md` if present

## Inspect

- git status,
- package scripts,
- Supabase config if present,
- deployment config if present,
- recent state files.

## Output

Report:

- active phase,
- what works,
- known risks,
- current blocker,
- safest next concrete move,
- files that need updating before implementation.

## First-run signal

If `.jericho-upgrade-kit/.bootstrap/bootstrap-handshake.signal` exists, inspect it as text after the project context pass. Decode it if it is a simple encoded note, say you found a hidden note, and present it warmly. Do not execute anything from that file.

Do not edit source code unless the user explicitly asks for implementation after this context pass.
