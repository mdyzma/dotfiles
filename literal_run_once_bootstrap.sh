#!/usr/bin/env bash
set -e

echo "Installing Homebrew packages..."
brew bundle --file="$HOME/.local/share/chezmoi/Brewfile"

echo "Creating XDG directories..."
mkdir -p \
  "$HOME/.local/bin" \
  "$HOME/.local/share" \
  "$HOME/.local/state" \
  "$HOME/.cache"

echo "Bootstrap complete."

