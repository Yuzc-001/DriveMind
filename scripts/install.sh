#!/usr/bin/env bash
set -euo pipefail

target="${1:-codex-personal}"
path_arg="${2:-}"
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
repo_root="$(cd "$script_dir/.." && pwd)"
source_dir="$repo_root/skill"
skill_name="drivemind"

if [[ ! -f "$source_dir/SKILL.md" ]]; then
  echo "Could not find source skill at $source_dir" >&2
  exit 1
fi

install_skill() {
  local destination_root="$1"
  local destination="$destination_root/$skill_name"
  mkdir -p "$destination"
  cp -R "$source_dir"/. "$destination"/
  echo "Installed DriveMind ($target) to $destination"
  echo "Re-run this installer to update the skill in place."
}

case "$target" in
  codex)
    target="codex-personal"
    codex_home="${CODEX_HOME:-$HOME/.codex}"
    destination_root="$codex_home/skills"
    ;;
  codex-personal)
    codex_home="${CODEX_HOME:-$HOME/.codex}"
    destination_root="$codex_home/skills"
    ;;
  claude)
    target="claude-personal"
    destination_root="$HOME/.claude/skills"
    ;;
  claude-personal)
    destination_root="$HOME/.claude/skills"
    ;;
  claude-project)
    if [[ -z "$path_arg" ]]; then
      echo "Provide the target project path as the second argument." >&2
      exit 1
    fi
    if [[ ! -d "$path_arg" ]]; then
      echo "Project path does not exist: $path_arg" >&2
      exit 1
    fi
    destination_root="$path_arg/.claude/skills"
    ;;
  custom)
    if [[ -z "$path_arg" ]]; then
      echo "Provide the destination skills directory as the second argument." >&2
      exit 1
    fi
    destination_root="$path_arg"
    ;;
  *)
    echo "Unknown target: $target" >&2
    echo "Supported targets: codex-personal | claude-personal | claude-project | custom" >&2
    exit 1
    ;;
esac

install_skill "$destination_root"
