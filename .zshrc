# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh


ZSH_THEME="powerlevel10k/powerlevel10k"

alias v="nvim"

alias l='exa'
alias la='exa -a'
alias ll='exa -lah'
alias ls='exa'

alias cat=bat
#Preferred editor for local and remote sessions


alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
# Define completion function for 'config' alias
_config() {
  local curcontext="$curcontext" state line
  # Set the completion options for the 'config' alias
  _arguments -C \
    '1: :->command' \
    '2: :_files'
}
# Add 'config' alias completion
compdef _config config

export EDITOR='vim'
plugins=(git)
eval "$(mcfly init zsh)"
export MCFLY_KEY_SCHEME=vim
export MCFLY_FUZZY=2

source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
