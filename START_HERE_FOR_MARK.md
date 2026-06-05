# Start Here For Mark

Happy birthday.

This is a builder kit for the software you have already been making. It is not here to take the wheel away from you. It is here to give your existing system a better memory, better safety rails, better upgrade rhythm, and a cleaner way for Claude Code to help without breaking what already works.

The core idea is simple:

- Keep your product direction.
- Keep your builder energy.
- Let Claude Code work from a stronger operating spine.
- Make hardening feel like normal building, not a scary separate chore.

## The 5 minute version

1. Open Claude Code inside the repo you want to upgrade.
2. Paste `https://github.com/manna-core/jericho-upgrade-kit`.
3. Tell Claude: "Install this into this repo and follow the link-only bootstrap instructions."
4. Let Claude do the first setup pass.
5. Do not deploy or push until you have reviewed what changed.

If Claude needs manual help, use `INSTALL_INTO_CLAUDE_CODE.md`.

## What you should feel quickly

Claude should stop acting like every session starts from zero. It should know:

- what the product is for,
- what phase the project is in,
- what not to break,
- which files hold current state,
- how to classify risky backend functions,
- how to make small upgrade batches,
- how to leave the next session with a clear next move.

## The most important safety rule

Do not paste live secrets into Claude. Do not commit `.env` files. Let Claude create `.env.example` files with placeholder names only.

If a live secret was ever committed, pasted into a document, or shared in a chat, rotate it in the provider dashboard.

## First good prompt

After installing the kit, paste this into Claude Code from the target repo:

```text
Read CLAUDE.md, .jericho-upgrade-kit/START_HERE_FOR_MARK.md, and .jericho-upgrade-kit/claude-prompts/00-ingest-this-kit.md.

Then do only the first setup pass:
- inspect the repo,
- create or update the project spine,
- classify obvious Supabase functions into a draft matrix,
- report the safest first upgrade batch,
- do not change source code yet.
```

## How to use the new commands

After install, Claude Code should expose project skills:

- `/jericho-start` - rebuild context and recommend the next concrete move.
- `/jericho-safety-pass` - inspect secrets, auth boundaries, public functions, and deployment risk.
- `/jericho-upgrade-batch` - implement one small nonbreaking upgrade and verify it.
- `/jericho-memory` - update project memory, decisions, and next steps.
- `/jericho-release-check` - run the pre-release checklist before deployment.

## The friendly warning

The project is big enough that the dangerous path is not "Claude writes bad code once." The dangerous path is losing track of why things were built, which endpoints are public, which data is sensitive, and what changed between sessions.

This kit is designed to fix that.
