# Enable completion
autoload -Uz compinit
compinit


# Enable menu selection
zstyle ':completion:*' menu select

# Enable case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'