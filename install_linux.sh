#!/bin/bash

# Exit on error
set -e

DOTFILES_DIR="$HOME/dotfiles"

echo "Starting Linux Setup..."

# Detect OS and install packages
if [ -f /etc/debian_version ]; then
    echo "Detected Debian/Ubuntu based system."
    sudo apt-get update
    sudo apt-get install -y zsh tmux neovim curl git jq htop wget
elif [ -f /etc/redhat-release ]; then
    echo "Detected RedHat/Fedora based system."
    sudo dnf install -y zsh tmux neovim curl git jq htop wget
else
    echo "Unsupported Linux distribution for automated package install. Skipping packages."
fi

# Install Oh My Zsh if not installed
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

echo "Creating symlinks..."
# Create necessary config directories
mkdir -p ~/.config

# Symlink existing files directly from dotfiles root
ln -sf "$DOTFILES_DIR/shell/zshrc" ~/.zshrc
ln -sf "$DOTFILES_DIR/shell/tmux.conf" ~/.tmux.conf
ln -sf "$DOTFILES_DIR/shell/alacritty.toml" ~/.config/alacritty.toml
ln -sfn "$DOTFILES_DIR/nvim" ~/.config/nvim

echo "Linux Setup Complete! Please change your default shell to zsh using: chsh -s \$(which zsh)"
