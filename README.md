# Jericho Upgrade Kit

A Claude Code-ready upgrade package for Jericho, Marvin, Thought Before Action, and nearby Momentum Company software.

This is meant to be a friendly builder kit, not a critique. The goal is to preserve what already works, add stronger operating rails, and give Claude Code a clear way to help with security, product memory, integrations, and nonbreaking upgrades.

## What this kit does

- Gives Claude Code a project memory and build discipline similar to the Manna operating spine.
- Adds repeatable project skills for status, safety passes, upgrade batches, memory maintenance, and release checks.
- Provides templates for roadmap, current state, next steps, decision memory, function classification, environment variables, incidents, and handoffs.
- Turns security hardening into small, auditable implementation packets instead of one risky rewrite.
- Helps a builder keep momentum while reducing the chance of leaking secrets, exposing sensitive data, or deploying unreviewed changes.

## What this kit does not do

- It does not connect to live Supabase, Vercel, GitHub, email, CRM, or customer systems by itself.
- It does not contain secrets.
- It does not assume the public GitHub repo is the same as the live production code.
- It does not make production changes without the builder explicitly doing that later.

## Fast path

1. Clone or download this kit somewhere nearby.
2. Run the installer against the existing Jericho or Momentum repo:

macOS/Linux:

```bash
bash ./scripts/install-jericho-kit.sh --target "/path/to/your/repo"
```

Windows:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\install-jericho-kit.ps1 -TargetPath "C:\path\to\your\repo"
```

3. Open Claude Code in the target repo.
4. Paste the contents of `.jericho-upgrade-kit/claude-prompts/00-ingest-this-kit.md`.
5. Start with `/jericho-start`, then `/jericho-safety-pass`.

If the repo already has a `CLAUDE.md`, the installer will avoid overwriting it and will place the kit instructions beside it for Claude to merge.

## Recommended first three upgrades

1. Build the project spine: `current_state.md`, `next_steps.md`, `roadmap.md`, `decision_memory.md`, and `task_state.json`.
2. Create a Supabase function classification matrix before changing function auth.
3. Add a CI gate for install, build, lint budget, dependency audit, and secret scanning.

## Public safety

This repository is intentionally safe to share publicly. It contains patterns, templates, checklists, and prompts. It should never include:

- Supabase URLs paired with secret keys.
- Service role keys, API keys, OAuth secrets, webhook secrets, tokens, passwords, or customer data.
- Private memory from another project or personal relationship files.
- Raw production logs.

## For Mark

Start here: `START_HERE_FOR_MARK.md`.
