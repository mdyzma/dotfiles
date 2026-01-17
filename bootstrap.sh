#!/bin/bash
set -eou pipefail

# === 1. OS Detection ===
OS="$(uname -s)"
ARCH="$(uname -m)"
echo "Detected OS: $OS ($ARCH)"

# === 2. Homebrew Installation ===
# Homebrew is the de-facto package manager for macOS and increasingly viable for user-space Linux.
if! command -v brew &> /dev/null; then
    echo "Homebrew not found. Installing..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Configure PATH immediately for the script execution
    if]; then
        test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    elif]; then
        test -d /opt/homebrew && eval "$(/opt/homebrew/bin/brew shellenv)"
        # On Intel Macs, path is /usr/local/bin
        test -d /usr/local/bin/brew && eval "$(/usr/local/bin/brew shellenv)"
    fi
else
    echo "Homebrew already installed."
fi

# === 3. Dependency Installation ===
# Install Git and Chezmoi. Git is likely pre-installed on Mac/Linux, but we ensure latest version.
echo "Installing Git and Chezmoi..."
brew install git chezmoi

# === 4. Chezmoi Initialization ===
# This pulls the dotfiles repo and applies the configuration.
# Replace 'GITHUB_USERNAME' with the actual user.
DOTFILES_REPO="https://github.com/GITHUB_USERNAME/dotfiles.git"

if [! -d "$HOME/.local/share/chezmoi" ]; then
    echo "Initializing Chezmoi from $DOTFILES_REPO..."
    chezmoi init --apply "$DOTFILES_REPO"
else
    echo "Chezmoi already initialized. Pulling latest changes..."
    chezmoi update
fi

echo "Bootstrapping complete. Please restart your terminal."
