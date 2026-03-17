#!/usr/bin/env bash
set -euo pipefail

target="${1:-}"
path_arg="${2:-}"
repo="${DRIVEMIND_REPO:-Yuzc-001/DriveMind}"
ref="${DRIVEMIND_REF:-main}"
repo_name="${repo##*/}"
tmp_dir="$(mktemp -d)"
archive_path="$tmp_dir/repo.tar.gz"

cleanup() {
  rm -rf "$tmp_dir"
}
trap cleanup EXIT

archive_url="https://github.com/$repo/archive/refs/heads/$ref.tar.gz"
echo "Downloading DriveMind from $archive_url"
curl -fsSL "$archive_url" -o "$archive_path"
tar -xzf "$archive_path" -C "$tmp_dir"

checkout="$(find "$tmp_dir" -maxdepth 1 -type d -name "$repo_name-*" | head -n 1)"
if [[ -z "$checkout" ]]; then
  echo "Could not find extracted repository contents." >&2
  exit 1
fi

run_install() {
  local t="$1"
  local p="${2:-}"
  if [[ -n "$p" ]]; then
    bash "$checkout/scripts/install.sh" "$t" "$p"
  else
    bash "$checkout/scripts/install.sh" "$t"
  fi
}

# Auto-detect mode: no target specified
if [[ -z "$target" ]]; then
  targets=()

  if [[ -d "$HOME/.claude" ]]; then
    targets+=("claude-personal")
  fi

  codex_home="${CODEX_HOME:-$HOME/.codex}"
  if [[ -d "$codex_home" ]]; then
    targets+=("codex-personal")
  fi

  if [[ ${#targets[@]} -eq 0 ]]; then
    echo "No AI tool directories detected. Installing to ~/.claude/skills as default."
    targets+=("claude-personal")
  fi

  echo ""
  echo "Detected targets: ${targets[*]}"
  echo ""

  for t in "${targets[@]}"; do
    run_install "$t"
  done

  echo ""
  echo "DriveMind install complete."
  exit 0
fi

# Explicit target mode
run_install "$target" "$path_arg"
