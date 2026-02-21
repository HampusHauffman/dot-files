# ===== Environment Variables =====
export EDITOR='nvim'
export VISUAL='nvim'
export LANG=en_US.UTF-8

export GIT_EDITOR='nvim'
export GPG_TTY=$(tty)
export XDG_CONFIG_HOME="$HOME/.config"
export EZA_CONFIG_DIR="$XDG_CONFIG_HOME/eza"

# Prepend user's local bin and current directory to PATH
export PATH="$HOME/.local/bin:$PATH"
export PATH=".:$PATH"

# ===== Zsh Configuration =====
# Completions
autoload -Uz compinit && compinit
source <(kubectl completion zsh)

# Keybindings
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^E' edit-command-line

# Up-arrow history search matching current input
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# ===== BREW =====
if [[ "$(uname)" == "Darwin" ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ "$(uname)" == "Linux" ]]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv zsh)"
fi

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


# ===== Functions =====
# Yazi file manager integration to change directory on quit
function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  yazi "$@" --cwd-file="$tmp"
  if IFS= read -r -d '' cwd <"$tmp" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
	  builtin cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}

# ===== Aliases =====
# Navigation and File Management
alias cd="z" # Use zoxide instead of cd
alias cat="bat" # Better cat
alias l="eza --color=always --icons=always"
alias ls="eza --color=always --icons=always"
alias la="eza -la --color=always --icons=always"
alias ll="eza -lah --color=always --icons=always"

# Git
alias g="git "
alias gg="lazygit"
alias ga="git add"
alias gS="git stash"
alias gSp="git stash pop"
alias gs="git status"
alias gp="git pull"
alias gP="git push"
alias gfP="git fetch && git push --force-with-lease"
alias gco="git checkout"
alias gcb="git checkout -b"
alias gcm="git commit --message"
alias gcam="git add . && gcm"
alias gca="git commit --amend --no-edit"
alias gr="git rebase"
alias grc="git rebase --continue"
alias gra="git rebase --abort"
alias grh="git reset --hard"
alias gconfe="git config user.email"
alias gconfu="git config user.name"

# GitHub Copilot CLI
alias gcs="gh copilot suggest"
alias gce="gh copilot explain"

# Utilities
alias v="nvim"
alias f="fuck" # TheFuck shorthand
alias ag="alias | grep"
alias killport='f() { kill $(lsof -t -i:$1); unset -f f; }; f'
alias gw="./gradlew"

# ===== Local Configuration =====
# Load machine-specific configuration if it exists
if [ -f "$HOME/.zshrc.local" ]; then
	source "$HOME/.zshrc.local"
fi
