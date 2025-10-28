#!/bin/bash

SOURCE="$HOME/.hick-os/.config"
TARGET="$HOME/.config"

mkdir -p "$TARGET"

for dir in "$SOURCE"/*/; do
    name=$(basename "$dir")
    src="$dir"
    dest="$TARGET/$name"

    if [[ -e "$dest" || -L "$dest" ]]; then
        rm -rf "$dest"
    fi

    ln -s "$src" "$dest"
    echo "🔗 Linked config: $name → $dest"
done
