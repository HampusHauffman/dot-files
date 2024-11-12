#Needed nvm for a project at work
export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Autocomplete
autoload -Uz compinit && compinit

# get the last line of the command "where mise" and use it to run the activate script
eval "$(mise activate zsh)"
#eval "$(/usr/local/bin/mise activate zsh)"
#eval "$(~/.local/bin/mise activate zsh)"
export EDITOR='nvim'
export VISUAL='nvim'
export GIT_EDITOR='nvim'

#Starship
eval "$(starship init zsh)"

#Fuck
eval "$(thefuck --alias)"

#Zoxide
eval "$(zoxide init zsh)"

# fzf
eval "$(fzf --zsh)"

#Flutter
export FLUTTER_ROOT="$(mise where flutter)"
export PATH="$PATH":"$HOME/.pub-cache/bin"

export LANG=en_US.UTF-8

alias v="nvim"

alias killport='f() { kill $(lsof -t -i:$1); unset -f f; }; f'

alias l="eza --color=always --icons=always"
alias ls="eza --color=always --icons=always"
alias la="eza -la --color=always --icons=always"
alias ll="eza -lah --color=always --icons=always"
alias ls="eza --color=always --icons=always"

alias f="fuck"

alias cat="bat"

alias cd="z"

# Alias for gh copilot
#unalias gcs
alias gcs="gh copilot suggest"
alias gce="gh copilot explain"

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
alias grh="git reset -hard"

alias gconfe="git config user.email"
alias gconfu="git config user.name"

alias zpr="git diff origin/main | zllm 'generate a PR description. Create a 1-2 sentence description and then include bullet points for the headings Added, Changed, and Removed. You may skip the headings if there is no content for them.'"

alias ag="alias | grep"

export GPG_TTY=$(tty)

# Add this function to your .zshrc file
glb() {
  # Default to 5 if no argument is provided
  local count=${1:-5}
  local i=0

  while [ "$i" -lt "$count" ]; do
    i=$((i + 1))
    echo -n "$i. "
    git rev-parse --symbolic-full-name "@{-${i}}" 2>/dev/null || break
  done
}


# Created by `pipx` on 2024-10-10 07:32:26
export PATH="$PATH:/Users/hampus/.local/bin"
export PATH="/usr/local/go/bin:$PATH"
