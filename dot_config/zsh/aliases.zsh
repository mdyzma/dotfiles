# brew install bat mc eza

alias cat='batcat'
# alias ls='eza'
alias mc='mc -b'

alias ..='cd ..'
alias ...='cd ../..'

alias ll='eza -l --header --icons --no-user --group-directories-first'
alias la='eza -la --header --icons --no-user --total-size --group-directories-first'
alias lt='eza --tree --icons --group-directories-first'

alias weather="curl wttr.in/Moszczenica"

#git
# Undo your last commit, but don't throw away your changes
alias git-undo="git reset --soft HEAD^"
alias gl="git log --color --pretty=oneline --abbrev-commit"
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gb="git branch"

alias gpu='nvidia-smi'
