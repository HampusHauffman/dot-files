# Autocomplete
autoload -Uz compinit && compinit

autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^X^E' edit-command-line

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

# zllm (AI) helpers
alias zpr="git diff origin/main | zllm 'generate a PR description. Create a 1-2 sentence description and then include bullet points for the headings Added, Changed, and Removed. You may skip the headings if there is no content for them.'"
alias zim="git diff origin/main | zllm 'Please carefully go through this PR and find any improvements to make this a very clean PR'"

# Utility
alias ag="alias | grep"
alias killport='f() { kill $(lsof -t -i:$1); unset -f f; }; f'

# ===== Functions =====
# List git branches with numbers
glb() {
  local count=${1:-5}
  local i=0

  while [ "$i" -lt "$count" ]; do
    i=$((i + 1))
    echo -n "$i. "
    git rev-parse --symbolic-full-name "@{-${i}}" 2>/dev/null || break
  done
}

# ===== Load Local Configuration =====
# Load machine-specific configuration if it exists
if [ -f "$HOME/.zshrc.local" ]; then
  source "$HOME/.zshrc.local"
fi
