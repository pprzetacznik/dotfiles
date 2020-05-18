# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

eval "`dircolors ~/.dircolors`"

# turn off ctrl-s in terminal
stty ixany
stty ixoff -ixon

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
export MANPAGER="vim -R \
    -c 'silent %sm/\\e.\\{-}m//g' \
    -c 'map q silent :q!<CR>' \
    -c 'map <SPACE> <C-D>' \
    -c 'map b <C-U>' \
    -c 'setlocal buftype=nofile' \
    -c 'nmap K :Man <C-R>=expand(\"<cword>\")<CR><CR>' \
    -c ':set ft=man nonu nolist'
    -c 'normal gg' -"
export EDITOR=vim
export WORKON_HOME=~/Envs
source ~/.local/bin/virtualenvwrapper.sh

# Erlang and elixir

export ELM_FORMAT_PATH=$HOME/workspace/elm-format
export ERL_TOP=~/otp-21.3.7
export LIBRARY_PATH=$ERL_TOP/lib/:$LIBRARY_PATH
export PATH=$ERL_TOP/bin:$PATH
export PATH=$HOME/elixir-1.8.1/bin:$PATH
export PATH=$ELM_FORMAT_PATH:$PATH
export PATH=$HOME/.local/bin:$HOME/bin:$HOME/.mix:$PATH
export PATH=$HOME/.npm-global/bin:$PATH

# PostgreSQL aliases

alias pgsqlon="sudo systemctl enable postgresql-11.service"
alias pgsqloff="sudo systemctl start postgresql-11.service"

# tmux attach
wincmd_next () {
    echo -ne '\e]51;["call","Tapi_wincmd",["w"]]\a'
}
bind -m vi -x '"\C-i": wincmd_next'
