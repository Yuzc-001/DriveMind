#!/usr/bin/env bash
set -euo pipefail

target="${1:-auto}"
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

fail() {
  echo "DriveMind bootstrap error: $*" >&2
  exit 1
}

command -v curl >/dev/null 2>&1 || fail "curl is required"
command -v tar >/dev/null 2>&1 || fail "tar is required"

archive_url="https://github.com/$repo/archive/$ref.tar.gz"
echo "Downloading DriveMind from $archive_url"
curl -fsSL "$archive_url" -o "$archive_path"
tar -xzf "$archive_path" -C "$tmp_dir"

checkout="$(find "$tmp_dir" -maxdepth 1 -type d -name "$repo_name-*" | head -n 1)"
[[ -n "$checkout" ]] || fail "could not find extracted DriveMind repository contents"
[[ -f "$checkout/scripts/install.sh" ]] || fail "could not find installer in downloaded repository"

if [[ -n "$path_arg" ]]; then
  bash "$checkout/scripts/install.sh" "$target" "$path_arg"
else
  bash "$checkout/scripts/install.sh" "$target"
fi
