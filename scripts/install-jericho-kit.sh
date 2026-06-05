#!/usr/bin/env bash
set -euo pipefail

TARGET_PATH="$(pwd)"
FORCE=0

usage() {
  cat <<'EOF'
Install the Jericho Upgrade Kit into a target repo.

Usage:
  bash ./scripts/install-jericho-kit.sh --target /path/to/repo
  bash ./scripts/install-jericho-kit.sh -t /path/to/repo --force

Options:
  -t, --target   Target repository path. Defaults to the current directory.
  --force        Overwrite files that already exist.
  -h, --help     Show this help.
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    -t|--target)
      if [[ $# -lt 2 ]]; then
        echo "Missing value for $1" >&2
        usage >&2
        exit 1
      fi
      TARGET_PATH="$2"
      shift 2
      ;;
    --force)
      FORCE=1
      shift
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown argument: $1" >&2
      usage >&2
      exit 1
      ;;
  esac
done

resolve_dir() {
  local path="$1"
  if [[ ! -d "$path" ]]; then
    echo "Path does not exist or is not a directory: $path" >&2
    exit 1
  fi
  (cd "$path" && pwd -P)
}

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
KIT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd -P)"
TARGET_ROOT="$(resolve_dir "$TARGET_PATH")"

if [[ "$TARGET_ROOT" == "$KIT_ROOT" ]]; then
  echo "Target path points at this kit. Pass the repo you want to upgrade with --target." >&2
  exit 1
fi

copy_file_safe() {
  local source="$1"
  local destination="$2"
  mkdir -p "$(dirname "$destination")"

  if [[ -e "$destination" && "$FORCE" != "1" ]]; then
    echo "skip existing: $destination"
    return
  fi

  cp "$source" "$destination"
  echo "copied: $destination"
}

copy_dir_safe() {
  local source_dir="$1"
  local destination_dir="$2"

  if [[ ! -d "$source_dir" ]]; then
    echo "Source directory not found: $source_dir" >&2
    exit 1
  fi

  mkdir -p "$destination_dir"

  while IFS= read -r -d '' source_file; do
    local relative_path="${source_file#"$source_dir"/}"
    copy_file_safe "$source_file" "$destination_dir/$relative_path"
  done < <(find "$source_dir" -type f -print0)
}

echo "Installing Jericho Upgrade Kit"
echo "Kit:    $KIT_ROOT"
echo "Target: $TARGET_ROOT"

KIT_DESTINATION="$TARGET_ROOT/.jericho-upgrade-kit"
mkdir -p "$KIT_DESTINATION"

copy_file_safe "$KIT_ROOT/README.md" "$KIT_DESTINATION/README.md"
copy_file_safe "$KIT_ROOT/CLAUDE_LINK_BOOTSTRAP.md" "$KIT_DESTINATION/CLAUDE_LINK_BOOTSTRAP.md"
copy_file_safe "$KIT_ROOT/START_HERE_FOR_MARK.md" "$KIT_DESTINATION/START_HERE_FOR_MARK.md"
copy_file_safe "$KIT_ROOT/INSTALL_INTO_CLAUDE_CODE.md" "$KIT_DESTINATION/INSTALL_INTO_CLAUDE_CODE.md"

copy_dir_safe "$KIT_ROOT/docs" "$KIT_DESTINATION/docs"
copy_dir_safe "$KIT_ROOT/templates" "$KIT_DESTINATION/templates"
copy_dir_safe "$KIT_ROOT/claude-prompts" "$KIT_DESTINATION/claude-prompts"
copy_dir_safe "$KIT_ROOT/examples" "$KIT_DESTINATION/examples"
copy_dir_safe "$KIT_ROOT/assets" "$KIT_DESTINATION/.bootstrap"

copy_dir_safe "$KIT_ROOT/project-spine" "$TARGET_ROOT/project-spine"
copy_dir_safe "$KIT_ROOT/claude-code-dropin/.claude/skills" "$TARGET_ROOT/.claude/skills"

TARGET_CLAUDE="$TARGET_ROOT/CLAUDE.md"
SIDECAR_CLAUDE="$TARGET_ROOT/CLAUDE.jericho-upgrade-kit.md"
DROPIN_CLAUDE="$KIT_ROOT/claude-code-dropin/CLAUDE.md"

if [[ -e "$TARGET_CLAUDE" ]]; then
  copy_file_safe "$DROPIN_CLAUDE" "$SIDECAR_CLAUDE"
  echo "Existing CLAUDE.md found. Kit instructions were placed in CLAUDE.jericho-upgrade-kit.md for merging."
else
  copy_file_safe "$DROPIN_CLAUDE" "$TARGET_CLAUDE"
fi

copy_file_safe "$KIT_ROOT/claude-code-dropin/.claude/settings.example.json" "$TARGET_ROOT/.claude/settings.example.json"

echo
echo "Install complete."
echo "Next:"
echo "1. Open Claude Code in: $TARGET_ROOT"
echo "2. Paste: .jericho-upgrade-kit/claude-prompts/00-ingest-this-kit.md"
echo "3. Run /jericho-start, then /jericho-safety-pass."
