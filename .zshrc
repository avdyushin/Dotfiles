source $HOME/.zsh/.zfunctions
source $HOME/.zsh/.zenv
source $HOME/.zsh/.zalias

setopt inc_append_history

autoload -U colors && colors
setopt prompt_subst
autoload -U compinit
compinit

# Vim mode
autoload -U edit-command-line
zle -N edit-command-line

bindkey -v

bindkey -M vicmd v edit-command-line
bindkey '^r' history-incremental-search-backward
bindkey '^A' vi-beginning-of-line
bindkey '^E' vi-end-of-line

function zle-line-init zle-keymap-select {
  VIM_MODE='%{$fg_bold[magenta]%}[% NORMAL]% %{$reset_color%}'
  RPS1="${${KEYMAP/vicmd/$VIM_MODE}/(main|viins)/}"
  zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

# case insensitive completion for cd etc *N*
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
#zstyle ':completion:*' menu select

unsetopt promptcr

precmd () { 
  print -Pn "\e]2;%~\a" 
}

PROMPT=$'$(base_prompt) $(git_prompt)\n ➜ '

