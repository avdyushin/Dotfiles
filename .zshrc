TOON=""

GIT_BRANCH="\ue0a0"
GIT_CLEAN=""
GIT_UNSTAGED="∙"
GIT_UNTRACKED="!"
GIT_STAGED="∙"

# GIT
#
# Will return the current branch name
# Usage example: git pull origin $(current_branch)
#
function current_branch() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo ${ref#refs/heads/}
}

function git_prompt_info() {
  branch="$(current_branch)" || return
  echo " $(parse_git_branch)%{$fg_bold[magenta]%}${branch}%{$fg_bold[green]%} $(parse_git_dirty)%{$reset_color%}"
}

function parse_git_branch() {
  gitstatus=$(git status 2>/dev/null | grep 'Your branch is based on')
  if [[ $(echo ${gitstatus} | grep -c '^Your branch is based on') > 0 ]]; then
    echo -n "$GIT_BRANCH "
  fi
}

function parse_git_dirty() {
  gitstat=$(git status 2>/dev/null | grep '\(Untracked\|Changes\)')

  if [[ $(echo ${gitstat} | grep -c "^Changes to be committed:") > 0 ]]; then
    echo -n $GIT_STAGED
  fi

  if [[ $(echo ${gitstat} | grep -c "^Changes not staged for commit:") > 0 ]]; then
    echo -n "%{$fg_bold[red]%}$GIT_UNSTAGED%{$reset_color%}"
  fi

  if [[ $(echo ${gitstat} | grep -c "^Untracked files:") > 0 ]]; then
    echo -n "%{$fg_bold[red]%}$GIT_UNTRACKED%{$reset_color%}"
  fi

  if [[ $(echo ${gitstat} | wc -l | tr -d ' ') == 0 ]]; then
    echo -n $GIT_CLEAN
  fi
}

function ios_simulator() {
  path=$(xcrun simctl list | grep Booted | awk '{print "~/Library/Developer/CoreSimulator/Devices/"substr($3, 2, length($3) - 2)}')
  echo $path
}

export HISTSIZE=1000
export SAVEHIST=1000
export HISTFILE=~/.zhistory
setopt inc_append_history

autoload -U colors && colors
setopt prompt_subst
autoload -U compinit
compinit

# Vim mode
autoload -U edit-command-line
zle -N edit-command-line

bindkey -v

bindkey '^r' history-incremental-search-backward
bindkey -M vicmd v edit-command-line

function zle-line-init zle-keymap-select {
  VIM_MODE='%{$fg_bold[magenta]%}[% NORMAL]% %{$reset_color%}'
  RPS1="${${KEYMAP/vicmd/$VIM_MODE}/(main|viins)/}"
  zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
export KEYTIMEOUT=1

# case insensitive completion for cd etc *N*
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

unsetopt promptcr
PROMPT=$'%{$fg_bold[blue]%}%n%{$reset_color%} $TOON %{$fg_bold[yellow]%}%m%{$reset_color%} %{$fg_bold[green]%}%~%{$reset_color%}$(git_prompt_info)\n ➜ '

# Update window title
precmd () { print -Pn "\e]2;%~\a" }

alias ls="ls -G"
alias ll="ls -Gla"
alias l="ls -Gla"
alias bc="bc -lq"
alias -g ND='*(/om[1])' # newest directory
alias -g NF='*(.om[1])' # newest file
alias -g ...="../.."

hash -d simulator="$(ios_simulator)"

export PATH="$HOME/.fastlane/bin:$HOME/scala/bin:$PATH"
export JAVA_HOME="$(/usr/libexec/java_home -v 1.8)"
