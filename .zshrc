autoload -U compinit && compinit -u

source $HOME/.zsh/.zfunctions
source $HOME/.zsh/.zbindkey
source $HOME/.zsh/.zenv
source $HOME/.zsh/.zalias

if [ -f $HOME/.zshlocal ]; then
    source $HOME/.zshlocal
fi

DIRSTACKSIZE=5
setopt autopushd # call pushd on each directory change
setopt pushdsilent # don't print directory history
setopt pushdignoredups # ignore copies

#setopt pushdminus # exchange + and -

autoload -U colors && colors

autoload -U edit-command-line
zle -N edit-command-line

#zle -N expand-ealias

setopt prompt_subst

setopt autocd

setopt inc_append_history
setopt share_history
setopt histignorespace
setopt hist_ignore_dups
setopt hist_expire_dups_first
setopt extended_history

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

zstyle ':completion:*:*:kill:*:processes' command 'ps -e -o pid,user,args'
zstyle ':completion:*:*:*:*:processes' list-colors "=(#b) #([0-9]#)*=0=${color[yellow]}"

zstyle ':completion:*' completer _expand_alias _complete _ignored
zstyle ':completion:*' regular true

precmd () {
  print -Pn "\e]2;%~\a"
  update_terminal_cwd()

  RPS1="$(insert-mode)"
  PROMPT=$'$(base-prompt) $(git-prompt)\n %% '
}

