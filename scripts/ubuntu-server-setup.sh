#!/usr/bin/bash

# Disable username/password auth for SSH 
# (ONLY allowing entry with private key)
sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config

# Disable ssh for root user
sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin no/g' /etc/ssh/sshd_config

# Restart ssh
sudo systemctl restart ssh

# Update apt repos
sudo apt update

# Upgrade installed repos
sudo apt upgrade

# Install new repos
sudo apt install neovim build-essential pkg-config libssl-dev unzip

# Install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | bash

# Install bun
curl -fsSL https://bun.sh/install | bash

# Remove vim (in favor of neovim)
sudo apt purge vim && sudo apt autoremove
