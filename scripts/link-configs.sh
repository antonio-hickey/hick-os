#!/bin/bash

SOURCE="$HOME/.hick-os/.config"
TARGET="$HOME/.config"

mkdir -p "$TARGET"

for item in "$SOURCE"/* "$SOURCE"/.*; do
    name=$(basename "$item")
    dest="$TARGET/$name"

    if [[ -e "$dest" || -L "$dest" ]]; then
        rm -rf "$dest"
    fi

    ln -s "$item" "$dest"
    echo "🔗 Linked config: $item → $dest"
done
