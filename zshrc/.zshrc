# Autocomplete
autoload -Uz compinit && compinit

autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^E' edit-command-line

# Environment variables
export EDITOR='nvim'
export VISUAL='nvim'
export GIT_EDITOR='nvim'
export LANG=en_US.UTF-8
export GPG_TTY=$(tty)

# ===== Tool Initialization =====
# Mise runtime version manager
eval "$(mise activate zsh)"

# Starship prompt
eval "$(starship init zsh)"

# TheFuck command correction
eval "$(thefuck --alias)"

# Zoxide smart directory jumper
eval "$(zoxide init zsh)"

# FZF fuzzy finder
eval "$(fzf --zsh)"

# Enables up-arrow history search matching current input
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# ===== Aliases =====
# Neovim
alias v="nvim"

# File management (eza as ls replacement)
alias l="eza --color=always --icons=always"
alias ls="eza --color=always --icons=always"
alias la="eza -la --color=always --icons=always"
alias ll="eza -lah --color=always --icons=always"

# Better cat with bat
alias cat="bat"

# Use zoxide instead of cd
alias cd="z"

# TheFuck shorthand
alias f="fuck"

# GitHub Copilot CLI
alias gcs="gh copilot suggest"
alias gce="gh copilot explain"

# Git aliases
alias g="git "
alias gp="git pull"
alias gP="git push"
alias gcm="git commit --message"
alias gcam="git add . && gcm"
alias ga="git add"
alias gs="git status"
alias gS="git stash"
alias gSp="git stash pop"
alias gcb="git checkout -b"
alias gco="git checkout"
alias gr="git rebase"
alias grc="git rebase --continue"
alias gra="git rebase --abort"
alias gfP="git fetch && git push --force-with-lease"
alias grh="git reset --hard"
alias gca="git commit --amend --no-edit"
alias gconfe="git config user.email"
alias gconfu="git config user.name"

# Utility
alias ag="alias | grep"
alias killport='f() { kill $(lsof -t -i:$1); unset -f f; }; f'

# ===== Load Local Configuration =====
# Load machine-specific configuration if it exists
if [ -f "$HOME/.zshrc.local" ]; then
  source "$HOME/.zshrc.local"
fi

