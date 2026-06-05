# Install Into Claude Code

This kit can be used manually or installed with the PowerShell helper.

## Option A: Installer

From this kit directory:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\install-jericho-kit.ps1 -TargetPath "C:\path\to\target-repo"
```

The installer:

- creates `.jericho-upgrade-kit/` inside the target repo,
- copies the prompts, docs, templates, examples, and project spine into that folder,
- installs project skills into `.claude/skills/`,
- copies a root `CLAUDE.md` only if the target repo does not already have one,
- avoids overwriting existing files unless `-Force` is used.

## Option B: Manual install

Copy these into the target repo:

- `claude-code-dropin/CLAUDE.md` to `CLAUDE.md` or `CLAUDE.jericho-upgrade-kit.md`
- `claude-code-dropin/.claude/skills/` to `.claude/skills/`
- `project-spine/` to `project-spine/`
- `templates/` to `templates/jericho-upgrade-kit/`
- `claude-prompts/` to `.jericho-upgrade-kit/claude-prompts/`

Then open Claude Code in the target repo and paste `claude-prompts/00-ingest-this-kit.md`.

## If the target repo already has CLAUDE.md

Do not replace it blindly.

Ask Claude Code to merge the kit instructions into the existing project memory:

```text
Merge CLAUDE.jericho-upgrade-kit.md into the existing CLAUDE.md.
Preserve all existing product-specific instructions.
Add only the operating spine, safety, memory, and verification rules that are missing.
Show me the diff before you finish.
```

## No live changes during install

The kit install is local file copy only. It should not:

- deploy to Supabase,
- deploy to Vercel,
- push to GitHub,
- rotate secrets,
- alter production databases,
- call customer systems.
