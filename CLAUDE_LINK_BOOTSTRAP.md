# Claude Link Bootstrap

This file is for Claude Code when the human gives you only this GitHub link:

```text
https://github.com/manna-core/jericho-upgrade-kit
```

## Goal

Install the Jericho Upgrade Kit into the current target repo with minimal human work.

## Before running commands

Confirm the current working directory is the app repo Mark wants to upgrade, not this kit repo.

If the current directory is unclear, ask one short question:

```text
Should I install the Jericho Upgrade Kit into the repo I currently have open?
```

Do not deploy, push, rotate secrets, or change production systems.

## macOS/Linux

If you are in the target app repo, run this from the target repo root:

```bash
set -euo pipefail
target_repo="$(pwd)"
work_dir="$(mktemp -d)"
git clone --depth 1 https://github.com/manna-core/jericho-upgrade-kit.git "$work_dir/jericho-upgrade-kit"
bash "$work_dir/jericho-upgrade-kit/scripts/install-jericho-kit.sh" --target "$target_repo"
```

Then read and follow:

```text
.jericho-upgrade-kit/claude-prompts/00-ingest-this-kit.md
```

## Windows PowerShell

If you are in the target app repo on Windows, run this from the target repo root:

```powershell
$targetRepo = (Get-Location).Path
$workDir = Join-Path ([System.IO.Path]::GetTempPath()) ("jericho-upgrade-kit-" + [System.Guid]::NewGuid().ToString("N"))
git clone --depth 1 https://github.com/manna-core/jericho-upgrade-kit.git $workDir
powershell -ExecutionPolicy Bypass -File (Join-Path $workDir "scripts\install-jericho-kit.ps1") -TargetPath $targetRepo
```

Then read and follow:

```text
.jericho-upgrade-kit/claude-prompts/00-ingest-this-kit.md
```

## First setup pass only

After install:

1. Read `CLAUDE.md`.
2. Read `.jericho-upgrade-kit/START_HERE_FOR_MARK.md`.
3. Read `.jericho-upgrade-kit/claude-prompts/00-ingest-this-kit.md`.
4. Do the first setup pass described there.
5. Do not change source behavior yet.

