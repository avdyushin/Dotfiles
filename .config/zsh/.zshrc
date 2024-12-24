export HISTFILE="$XDG_CACHE_HOME/.zsh_history"
export HISTSIZE=1024
export SAVEHIST=1024

autoload -U compinit && compinit -u

source $ZDOTDIR/.zfunctions
source $ZDOTDIR/.zbindkey
source $ZDOTDIR/.zalias

if [ -f $HOME/.zprofile ]; then
    source $HOME/.zprofile
fi

DIRSTACKSIZE=5
setopt autopushd # call pushd on each directory change
setopt pushdsilent # don't print directory history
setopt pushdignoredups # ignore copies

#setopt pushdminus # exchange + and -

autoload -U colors && colors

autoload -U edit-command-line
zle -N edit-command-line

# Version control details
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn
# allow check for changes
zstyle ':vcs_info:*' check-for-changes true
#sets unstaged string to this
zstyle ':vcs_info:git:*' unstagedstr "!"
#sets staged string to this
zstyle ':vcs_info:git:*' stagedstr "+"
#sets format
zstyle ':vcs_info:git:*' formats ' %b %m%u%k%c'

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

zstyle ':completion:*' completer _expand_alias _complete _ignored _extensions _approximate
zstyle ':completion:*' regular true
zstyle ':completion:*' menu select
zstyle ':completion:*' file-list all
zstyle ':completion:*:*:*:*:descriptions' format '%F{green}-- %d --%f'
zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}!- %d (errors: %e) -!%f'

function base-prompt() {
    prefix='%F{yellow}┌┄─%f'
    color_user="%F{blue}\e[3m%n\e[0m%f"
    color_host="%F{yellow}%m%f"
    color_path="%F{green}%~%f"
    echo $prefix $color_user $color_path
}

precmd() {
  #print -Pn "\e]2;%~\a"
  #update_terminal_cwd()

  P2='└──┄┄%f'
  ERR="%(?.%F{yellow}$P2.%F{red}$P2)%f"

  RPS1="$(insert-mode)"

  vcs_info
  if [[ -n ${vcs_info_msg_0_} ]]; then
      GIT="%F{magenta}${vcs_info_msg_0_}%f"
      PS1=$'$(base-prompt) $GIT \n$ERR '
  else
      PS1=$'$(base-prompt) \n$ERR '
  fi
}
