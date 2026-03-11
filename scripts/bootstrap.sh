#!/usr/bin/env bash
set -euo pipefail

target="${1:-codex-personal}"
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

if [[ -n "$path_arg" ]]; then
  bash "$checkout/scripts/install.sh" "$target" "$path_arg"
else
  bash "$checkout/scripts/install.sh" "$target"
fi
