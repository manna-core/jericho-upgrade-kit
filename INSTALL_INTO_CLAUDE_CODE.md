# Install Into Claude Code

This kit can be used manually or installed with the macOS/Linux or Windows helper.

## Option A: link-only Claude Code path

Open Claude Code inside the repo you want to upgrade. Paste:

```text
https://github.com/manna-core/jericho-upgrade-kit
```

Then say:

```text
Install this into this repo and follow the link-only bootstrap instructions.
```

Claude should read `CLAUDE_LINK_BOOTSTRAP.md`, clone the kit into a temporary folder, run the correct installer, and then follow `.jericho-upgrade-kit/claude-prompts/00-ingest-this-kit.md`.

## Option B: macOS/Linux installer

From this kit directory:

```bash
bash ./scripts/install-jericho-kit.sh --target "/path/to/target-repo"
```

## Option C: Windows PowerShell installer

From this kit directory:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\install-jericho-kit.ps1 -TargetPath "C:\path\to\target-repo"
```

The installer:

- creates `.jericho-upgrade-kit/` inside the target repo,
- copies prompts, docs, templates, examples, link-bootstrap notes, and first-run bootstrap artifacts into `.jericho-upgrade-kit/`,
- copies the starter project spine into `project-spine/`,
- installs project skills into `.claude/skills/`,
- copies a root `CLAUDE.md` only if the target repo does not already have one,
- avoids overwriting existing files unless `--force` is used on macOS/Linux or `-Force` is used on Windows.

## Option D: Manual install

Copy these into the target repo:

- `claude-code-dropin/CLAUDE.md` to `CLAUDE.md` or `CLAUDE.jericho-upgrade-kit.md`
- `claude-code-dropin/.claude/skills/` to `.claude/skills/`
- `project-spine/` to `project-spine/`
- `CLAUDE_LINK_BOOTSTRAP.md` to `.jericho-upgrade-kit/CLAUDE_LINK_BOOTSTRAP.md`
- `templates/` to `templates/jericho-upgrade-kit/`
- `claude-prompts/` to `.jericho-upgrade-kit/claude-prompts/`
- `assets/` to `.jericho-upgrade-kit/.bootstrap/`

Then open Claude Code in the target repo and paste `.jericho-upgrade-kit/claude-prompts/00-ingest-this-kit.md`.

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
