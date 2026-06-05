param(
  [string]$TargetPath = (Get-Location).Path,
  [switch]$Force
)

$ErrorActionPreference = "Stop"

function Resolve-FullPath {
  param([string]$Path)

  if (-not (Test-Path -LiteralPath $Path)) {
    throw "Path does not exist: $Path"
  }

  return (Resolve-Path -LiteralPath $Path).Path
}

function Copy-FileSafe {
  param(
    [string]$Source,
    [string]$Destination,
    [switch]$ForceCopy
  )

  $destinationDir = Split-Path -Parent $Destination
  if (-not (Test-Path -LiteralPath $destinationDir)) {
    New-Item -ItemType Directory -Force -Path $destinationDir | Out-Null
  }

  if ((Test-Path -LiteralPath $Destination) -and -not $ForceCopy) {
    Write-Host "skip existing: $Destination"
    return
  }

  Copy-Item -LiteralPath $Source -Destination $Destination -Force:$ForceCopy
  Write-Host "copied: $Destination"
}

function Copy-DirectorySafe {
  param(
    [string]$SourceDirectory,
    [string]$DestinationDirectory,
    [switch]$ForceCopy
  )

  if (-not (Test-Path -LiteralPath $SourceDirectory)) {
    throw "Source directory not found: $SourceDirectory"
  }

  New-Item -ItemType Directory -Force -Path $DestinationDirectory | Out-Null

  Get-ChildItem -LiteralPath $SourceDirectory -Recurse -File | ForEach-Object {
    $relativePath = $_.FullName.Substring($SourceDirectory.Length).TrimStart("\", "/")
    $destination = Join-Path $DestinationDirectory $relativePath
    Copy-FileSafe -Source $_.FullName -Destination $destination -ForceCopy:$ForceCopy
  }
}

$scriptRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$kitRoot = Split-Path -Parent $scriptRoot
$targetRoot = Resolve-FullPath -Path $TargetPath
$resolvedKitRoot = Resolve-FullPath -Path $kitRoot

if ($targetRoot -eq $resolvedKitRoot) {
  throw "TargetPath points at this kit. Pass the repo you want to upgrade with -TargetPath."
}

Write-Host "Installing Jericho Upgrade Kit"
Write-Host "Kit:    $resolvedKitRoot"
Write-Host "Target: $targetRoot"

$kitDestination = Join-Path $targetRoot ".jericho-upgrade-kit"
New-Item -ItemType Directory -Force -Path $kitDestination | Out-Null

Copy-FileSafe -Source (Join-Path $resolvedKitRoot "README.md") -Destination (Join-Path $kitDestination "README.md") -ForceCopy:$Force
Copy-FileSafe -Source (Join-Path $resolvedKitRoot "START_HERE_FOR_MARK.md") -Destination (Join-Path $kitDestination "START_HERE_FOR_MARK.md") -ForceCopy:$Force
Copy-FileSafe -Source (Join-Path $resolvedKitRoot "INSTALL_INTO_CLAUDE_CODE.md") -Destination (Join-Path $kitDestination "INSTALL_INTO_CLAUDE_CODE.md") -ForceCopy:$Force

Copy-DirectorySafe -SourceDirectory (Join-Path $resolvedKitRoot "docs") -DestinationDirectory (Join-Path $kitDestination "docs") -ForceCopy:$Force
Copy-DirectorySafe -SourceDirectory (Join-Path $resolvedKitRoot "templates") -DestinationDirectory (Join-Path $kitDestination "templates") -ForceCopy:$Force
Copy-DirectorySafe -SourceDirectory (Join-Path $resolvedKitRoot "claude-prompts") -DestinationDirectory (Join-Path $kitDestination "claude-prompts") -ForceCopy:$Force
Copy-DirectorySafe -SourceDirectory (Join-Path $resolvedKitRoot "examples") -DestinationDirectory (Join-Path $kitDestination "examples") -ForceCopy:$Force

$targetSpine = Join-Path $targetRoot "project-spine"
Copy-DirectorySafe -SourceDirectory (Join-Path $resolvedKitRoot "project-spine") -DestinationDirectory $targetSpine -ForceCopy:$Force

$targetSkills = Join-Path $targetRoot ".claude\skills"
Copy-DirectorySafe -SourceDirectory (Join-Path $resolvedKitRoot "claude-code-dropin\.claude\skills") -DestinationDirectory $targetSkills -ForceCopy:$Force

$targetClaude = Join-Path $targetRoot "CLAUDE.md"
$sidecarClaude = Join-Path $targetRoot "CLAUDE.jericho-upgrade-kit.md"
$dropinClaude = Join-Path $resolvedKitRoot "claude-code-dropin\CLAUDE.md"

if (Test-Path -LiteralPath $targetClaude) {
  Copy-FileSafe -Source $dropinClaude -Destination $sidecarClaude -ForceCopy:$Force
  Write-Host "Existing CLAUDE.md found. Kit instructions were placed in CLAUDE.jericho-upgrade-kit.md for merging."
} else {
  Copy-FileSafe -Source $dropinClaude -Destination $targetClaude -ForceCopy:$Force
}

Copy-FileSafe -Source (Join-Path $resolvedKitRoot "claude-code-dropin\.claude\settings.example.json") -Destination (Join-Path $targetRoot ".claude\settings.example.json") -ForceCopy:$Force

Write-Host ""
Write-Host "Install complete."
Write-Host "Next:"
Write-Host "1. Open Claude Code in: $targetRoot"
Write-Host "2. Paste: .jericho-upgrade-kit\claude-prompts\00-ingest-this-kit.md"
Write-Host "3. Run /jericho-start, then /jericho-safety-pass."
