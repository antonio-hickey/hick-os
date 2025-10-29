#!/bin/bash

# NOTE: That at this point we assume a totally fresh machine
# so a nice modern TUI/CLI isn't an option, we must use raw bash here.

# Define colors
GREEN="\033[0;32m"
YELLOW="\033[0;33m"
NO_COLOR="\033[0m"

# Define paths
ROOT="$HOME/.hick-os"
toml_file="$ROOT/packages.toml"

# Parse the defined package groups from the toml file.
#
# TODO: Support other package managers (APT, Brew, Scoop, etc).
section_lines=$(awk -v sec="[packages.pacman]" '
    $0 == sec {flag=1; next} 
    /^\[.*\]/ {flag=0} 
    flag {print}
' "$toml_file")

# Extract and display the available package groups 
keys=()
while IFS= read -r line; do
    [[ -z "$line" || "$line" =~ ^# ]] && continue
    key=$(echo "$line" | sed -E 's/([a-zA-Z0-9_.-]+).*/\1/')
    keys+=("$key")
done <<< "$section_lines"
echo -e "\n=== Available Package Groups ==="
for i in "${!keys[@]}"; do
    echo "  $((i+1))) ${keys[$i]}"
done
echo

# Select the package groups to install
read -p "Enter key numbers separated by space: " -a selection

# Validate package group selections
valid_selection=()
for i in "${selection[@]}"; do
    if [[ $i -ge 1 && $i -le ${#keys[@]} ]]; then
        valid_selection+=("$i")
    else
        echo "${YELLOW}Warning: $i is not a valid choice, skipping.${NO_COLOR}"
    fi
done
selection=("${valid_selection[@]}")

# Install packages for each selected group
for i in "${selection[@]}"; do
    key="${keys[$((i-1))]}"

    value=$(awk -v key="$key" '
        $0 ~ key"[[:space:]]*=" {found=1}
        found {
            gsub(/^[[:space:]]+|[[:space:]]+$/, "")
            if ($0 ~ /\]/) {print; exit}
            print
        }
    ' <<< "$section_lines" | tr -d '[]"'\''',)
    value=$(echo "$value" | tr ',' ' ' | xargs)

    echo -e "${GREEN}Installing package group: $key${NO_COLOR}: $value"
    sudo pacman -Syu --noconfirm $value
done
