# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#Needed nvm for a project at work
 export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion


# get the last line of the command "where mise" and use it to run the activate script
eval "$(mise activate zsh)"
#eval "$(/usr/local/bin/mise activate zsh)"
#eval "$(~/.local/bin/mise activate zsh)"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git)

export EDITOR='nvim'
export VISUAL='nvim'
export GIT_EDITOR='nvim'

#Fuck
eval "$(thefuck --alias)"

#Zoxide
eval "$(zoxide init zsh)"

# fzf
eval "$(fzf --zsh)"

#Flutter
export FLUTTER_ROOT="$(mise where flutter)"
export PATH="$PATH":"$HOME/.pub-cache/bin"

export ZSH="$HOME/.oh-my-zsh"

export LANG=en_US.UTF-8

source $ZSH/oh-my-zsh.sh

alias v="nvim"

alias l="eza --color=always --icons=always"
alias ls="eza --color=always --icons=always"
alias la="eza -la --color=always --icons=always"
alias ll="eza -lah --color=always --icons=always"
alias ls="eza --color=always --icons=always"

alias f="fuck"

alias cat="bat"

alias cd="z"

# Alias for gh copilot
unalias gcs
alias gcs="gh copilot suggest"
alias gce="gh copilot explain"

alias gp="git pull"
alias gP="git push"
alias gcm="git commit --message"

alias ag="alias | grep"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export GPG_TTY=$(tty)

