set -o vi
shopt -s cdspell autocd histappend
. /usr/share/bash-completion/bash_completion

PS1='\e[96m\h\e[95m$PWD\e[93m $?\e[m\n$ '

export EDITOR='nvim'

alias vim='nvim'
alias ls='ls --color=auto'
alias grep='grep --color=auto'

