#!/usr/bin/env bash
set -euo pipefail

target="${1:-codex-personal}"
path_arg="${2:-}"
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
repo_root="$(cd "$script_dir/.." && pwd)"
source_dir="$repo_root/skill"
skill_name="drivemind"

fail() {
  echo "DriveMind install error: $*" >&2
  exit 1
}

assert_drivemind_package() {
  local required=(
    "SKILL.md"
    "references/drift-prevention.md"
    "references/boundary-preservation.md"
    "references/continuity-preservation.md"
    "references/stuck-recovery.md"
    "references/closure-compounding.md"
    "references/execution-ceiling.md"
    "templates/review-template.md"
  )

  for item in "${required[@]}"; do
    [[ -e "$source_dir/$item" ]] || fail "package is incomplete; missing $item"
  done
}

codex_skills_root() {
  printf '%s\n' "${CODEX_HOME:-$HOME/.codex}/skills"
}

claude_skills_root() {
  printf '%s\n' "$HOME/.claude/skills"
}

install_drivemind_package() {
  local target_name="$1"
  local destination_root="$2"
  local destination="$destination_root/$skill_name"

  mkdir -p "$destination_root"
  rm -rf "$destination"
  mkdir -p "$destination"

  cp "$source_dir/SKILL.md" "$destination/"
  cp -R "$source_dir/references" "$destination/"
  cp -R "$source_dir/templates" "$destination/"

  [[ -f "$destination/SKILL.md" ]] || fail "install failed; missing $destination/SKILL.md"
  echo "Installed DriveMind ($target_name) to $destination"
}

assert_drivemind_package

case "$target" in
  auto)
    installed_any=0
    if [[ -d "$HOME/.claude" ]]; then
      install_drivemind_package "claude-personal" "$(claude_skills_root)"
      installed_any=1
    fi
    codex_home="${CODEX_HOME:-$HOME/.codex}"
    if [[ -d "$codex_home" ]]; then
      install_drivemind_package "codex-personal" "$(codex_skills_root)"
      installed_any=1
    fi
    if [[ "$installed_any" -eq 0 ]]; then
      install_drivemind_package "claude-personal" "$(claude_skills_root)"
    fi
    ;;
  codex|codex-personal)
    install_drivemind_package "codex-personal" "$(codex_skills_root)"
    ;;
  claude|claude-personal)
    install_drivemind_package "claude-personal" "$(claude_skills_root)"
    ;;
  claude-project)
    [[ -n "$path_arg" ]] || fail "provide the target project path as the second argument"
    [[ -d "$path_arg" ]] || fail "project path does not exist: $path_arg"
    install_drivemind_package "claude-project" "$path_arg/.claude/skills"
    ;;
  custom)
    [[ -n "$path_arg" ]] || fail "provide the destination skills directory as the second argument"
    install_drivemind_package "custom" "$path_arg"
    ;;
  *)
    fail "unknown target: $target"
    ;;
esac

echo "DriveMind install complete."
