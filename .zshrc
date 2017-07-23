source $HOME/.zsh/.zfunctions
source $HOME/.zsh/.zenv
source $HOME/.zsh/.zalias

autoload -U colors && colors
autoload -U compinit && compinit

autoload -U edit-command-line
zle -N edit-command-line

setopt prompt_subst

setopt autocd

setopt inc_append_history
setopt share_history

setopt correct

setopt brace_ccl

bindke -v

bindkey -M vicmd v edit-command-line
bindkey '^r' history-incremental-search-backward
bindkey '^A' vi-beginning-of-line
bindkey '^E' vi-end-of-line

function zle-line-init zle-keymap-select {
  VIM_MODE='%F{237}[% NORMAL]% %f'
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

PROMPT=$'$(base_prompt) $(git_prompt)\n ❯ '

