param(
  [string]$Root = (Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path))
)

$ErrorActionPreference = "Stop"
$rootPath = (Resolve-Path -LiteralPath $Root).Path
$failed = $false

$requiredFiles = @(
  "README.md",
  "START_HERE_FOR_MARK.md",
  "INSTALL_INTO_CLAUDE_CODE.md",
  "CLAUDE.md",
  "CLAUDE_LINK_BOOTSTRAP.md",
  "docs/safety-model.md",
  "docs/memory-architecture.md",
  "docs/sources.md",
  "project-spine/current_state.md",
  "project-spine/next_steps.md",
  "project-spine/decision_memory.md",
  "project-spine/task_state.json",
  "project-spine/function_classification_matrix.md",
  "claude-prompts/00-ingest-this-kit.md",
  "claude-code-dropin/CLAUDE.md",
  "claude-code-dropin/.claude/skills/jericho-start/SKILL.md",
  "assets/bootstrap-handshake.signal",
  "scripts/install-jericho-kit.ps1",
  "scripts/install-jericho-kit.sh"
)

foreach ($file in $requiredFiles) {
  $path = Join-Path $rootPath $file
  if (-not (Test-Path -LiteralPath $path)) {
    Write-Error "Missing required file: $file"
    $failed = $true
  }
}

$jsonPath = Join-Path $rootPath "project-spine/task_state.json"
try {
  Get-Content -Raw -LiteralPath $jsonPath | ConvertFrom-Json | Out-Null
} catch {
  Write-Error "Invalid JSON: project-spine\task_state.json"
  $failed = $true
}

$secretPatterns = @(
  "sb_secret_[A-Za-z0-9_-]{20,}",
  "sk_live_[A-Za-z0-9_-]{20,}",
  "sk_test_[A-Za-z0-9_-]{20,}",
  "ghp_[A-Za-z0-9]{20,}",
  "github_pat_[A-Za-z0-9_]{20,}",
  "xox[baprs]-[A-Za-z0-9-]{20,}",
  "eyJ[A-Za-z0-9_-]{20,}\.[A-Za-z0-9_-]{20,}\.[A-Za-z0-9_-]{20,}"
)

$filesToScan = Get-ChildItem -LiteralPath $rootPath -Recurse -File |
  Where-Object {
    $_.FullName -notmatch "[\\/]\\.git[\\/]" -and
    $_.FullName -notmatch "[\\/]node_modules[\\/]" -and
    $_.FullName -notmatch "[\\/]tmp[\\/]" -and
    $_.FullName -notmatch "[\\/]dist[\\/]" -and
    $_.FullName -notmatch "[\\/]build[\\/]"
  }

foreach ($pattern in $secretPatterns) {
  $matches = $filesToScan | Select-String -Pattern $pattern -AllMatches
  foreach ($match in $matches) {
    Write-Error "Possible secret-like token found: $($match.Path):$($match.LineNumber)"
    $failed = $true
  }
}

if ($failed) {
  throw "Validation failed."
}

Write-Host "Validation passed for $rootPath"
