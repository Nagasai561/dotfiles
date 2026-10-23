# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='\[\e[35m\][\[\e[90m\]\w\[\e[35m\]]\$\[\e[0m\] '

# Setup __zoxide_* shell functions
eval "$(zoxide init bash --cmd cd)"

# Aliases
alias ls='eza'
alias tree='eza --tree'
alias cat='bat'
alias pbcopy='wl-copy'
alias pbpaste='wl-paste'

# Python venv
source "$HOME/.venv/bin/activate"

export PATH="/home/nagasai/.local/bin:$PATH"
