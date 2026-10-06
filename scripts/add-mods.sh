#!/usr/bin/env bash
# Usage: ./scripts/add-mods.sh mods/mod.txt (or any file name with a list of mods, one per line)

LIST="$(realpath "$1")"
cd "$(dirname "$0")/../pack" || exit 1

while read -r line; do
    mod="${line%%#*}"
    mod="$(echo $mod)"
    [ -z "$mod" ] && continue

    echo ">>> $mod"
    packwiz modrinth add "$mod" -y \
        || packwiz curseforge add "$mod" -y \
        || echo "$mod" >> ../failed-mods.txt
done < "$LIST"

packwiz refresh