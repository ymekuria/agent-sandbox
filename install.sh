#!/usr/bin/env sh
set -eu

# agent-sandbox installer
# Symlinks bin/agent-sandbox into ~/.local/bin (or PREFIX).

prefix="${PREFIX:-$HOME/.local/bin}"
script_dir="$(cd "$(dirname "$0")" && pwd)"
source="$script_dir/bin/agent-sandbox"
target="$prefix/agent-sandbox"

if [ ! -f "$source" ]; then
  printf 'Error: %s not found. Run this script from the repo root.\n' "$source" >&2
  exit 1
fi

mkdir -p "$prefix"
ln -sf "$source" "$target"
printf 'Installed agent-sandbox -> %s\n' "$target"

case ":$PATH:" in
  *":$prefix:"*) ;;
  *)
    printf '\n%s is not on your PATH.\n' "$prefix"
    printf 'Add this to your shell profile:\n\n'
    # shellcheck disable=SC2016
    printf '  export PATH="%s:$PATH"\n' "$prefix"
    ;;
esac
