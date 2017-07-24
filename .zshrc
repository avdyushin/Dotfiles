source $HOME/.zsh/.zfunctions
source $HOME/.zsh/.zbindkey
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

unsetopt promptcr

function insert-mode() { echo "" }
function normal-mode() { echo "-- NORMAL --" }

zle-line-init zle-keymap-select() {
  case $KEYMAP in
    vicmd)      vi_mode="$(normal-mode)" ;;
    viins|main) vi_mode="$(insert-mode)" ;;
    *)          vi_mode="$(insert-mode)" ;;
  esac
  RPS1=$'$vi_mode'
  zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

precmd () {
  print -Pn "\e]2;%~\a"

  RPS1="$(insert-mode)"
  PROMPT=$'$(base-prompt) $(git-prompt)\n ❯ '
}

