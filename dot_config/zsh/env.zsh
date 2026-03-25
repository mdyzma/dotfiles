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

# =========================================
# Poetry (XDG Compliant)
# =========================================
export POETRY_HOME="$XDG_DATA_HOME/pypoetry"
export POETRY_CONFIG_DIR="$XDG_CONFIG_HOME/pypoetry"
export POETRY_CACHE_DIR="$XDG_CACHE_HOME/pypoetry"
export POETRY_DATA_DIR="$XDG_DATA_HOME/pypoetry"

# Add the binary to your path
export PATH="$POETRY_HOME/bin:$PATH"


# =========================================
# Node.js / fnm
# =========================================
export PATH="$XDG_DATA_HOME/fnm:$PATH"
if command -v fnm >/dev/null 2>&1; then
  eval "$(fnm env --use-on-cd)"
fi


## =========================================
## Rust
## =========================================
#
#. "$HOME/.cargo/env" 2>/dev/null || true

# =========================================
# Zoxide (Smart cd)
# =========================================

eval "$(zoxide init zsh)"

# =========================================
# fzf
# =========================================
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
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

# =========================================
# bun
# =========================================

 # bun completions
 [ -s "/home/mdyzma/.bun/_bun" ] && source "/home/mdyzma/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# =========================================
# Global Editor (XDG Compliant)
# =========================================
export EDITOR='nano'
export VISUAL='nano'
