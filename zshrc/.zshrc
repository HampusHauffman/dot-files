# Environment variables
export EDITOR='nvim'
export VISUAL='nvim'
export GIT_EDITOR='nvim'
export LANG=en_US.UTF-8
export GPG_TTY=$(tty)
export XDG_CONFIG_HOME="$HOME/.config"
export EZA_CONFIG_DIR="$XDG_CONFIG_HOME/eza"
export PATH=".:$PATH"

# ===== Tool Initialization ===== Mise runtime version manager
eval "$(mise activate zsh)"

# Starship prompt
eval "$(starship init zsh)"

# TheFuck command correction
eval "$(thefuck --alias)"

# Zoxide smart directory jumper
eval "$(zoxide init zsh)"

# FZF fuzzy finder
eval "$(fzf --zsh)"

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Autocomplete
autoload -Uz compinit && compinit

autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^E' edit-command-line

# Kubectl autocompletion
source <(kubectl completion zsh)

# Allows use if y for search and change dir using yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd <"$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

# Enables up-arrow history search matching current input
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# ===== Aliases =====

alias ip="ipconfig getifaddr en0"
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

alias gg="lazygit"
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

# Gradle
alias gw="./gradlew"

# ===== Load Local Configuration =====
# Load machine-specific configuration if it exists
if [ -f "$HOME/.zshrc.local" ]; then
	source "$HOME/.zshrc.local"
fi
