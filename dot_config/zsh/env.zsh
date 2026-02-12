# =========================================
# XDG Base Directories
# =========================================

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

export PATH="$HOME/.local/bin:$PATH"

# =========================================
# Python / pyenv
# =========================================

export PYENV_ROOT="$XDG_DATA_HOME/pyenv"
export PYENV_CACHE_PATH="$XDG_CACHE_HOME/pyenv"
export PYENV_SHELL=zsh

export PATH="$PYENV_ROOT/bin:$PATH"

if command -v pyenv >/dev/null 2>&1; then
  eval "$(pyenv init - zsh)"
fi

## =========================================
## Rust
## =========================================
#
#. "$HOME/.cargo/env" 2>/dev/null || true

# =========================================
# fzf
# =========================================

source <(fzf --zsh)

# =========================================
# starship
# =========================================

eval "$(starship init zsh)"

# =========================================
# atuin
# =========================================

. "$HOME/.atuin/bin/env"
if command -v atuin >/dev/null 2>&1; then
  eval "$(atuin init zsh)"
fi
