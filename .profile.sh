#!/bin/bash

eval "`dircolors ~/.dircolors`"

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

alias l='ls -CF'
alias la='ls -A'
alias ll='ls -alFh --color=auto'
alias ls='ls --color=auto'
alias mc='. /usr/lib/mc/mc-wrapper.sh'
alias dusort='du -a . | sort -n -r | head -n 10'
alias emacsx='emacs'
alias emacs='emacs -nw'
alias vim="gvim -v"
export PAGER="/bin/sh -c \"unset PAGER;col -b -x | \
    vim -R -c 'set ft=man nomod nolist' -c 'map q :q<CR>' \
    -c 'map <SPACE> <C-D>' -c 'map b <C-U>' \
    -c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\""
export EDITOR=vim
export WORKON_HOME=~/Envs
source /usr/local/bin/virtualenvwrapper.sh

# turn off ctrl-s in terminal
stty ixany
stty ixoff -ixon
