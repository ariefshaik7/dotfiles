#!/bin/bash

# Exit on error
set -e

DOTFILES_DIR="$HOME/dotfiles"

echo "Starting macOS Setup..."

# Install Homebrew if not installed
if ! command -v brew &> /dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install Oh My Zsh if not installed
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

echo "Installing Homebrew bundles..."
# This will install everything from the Brewfile including zsh-autosuggestions
brew bundle --file="$DOTFILES_DIR/Brewfile"

echo "Creating symlinks..."
# Create necessary config directories
mkdir -p ~/.config
mkdir -p ~/.warp/themes

# Symlink existing files directly from dotfiles root
ln -sf "$DOTFILES_DIR/shell/zshrc" ~/.zshrc
ln -sf "$DOTFILES_DIR/shell/tmux.conf" ~/.tmux.conf
ln -sf "$DOTFILES_DIR/shell/alacritty.toml" ~/.config/alacritty.toml
ln -sfn "$DOTFILES_DIR/nvim" ~/.config/nvim

echo "macOS Setup Complete! Please restart your terminal."
