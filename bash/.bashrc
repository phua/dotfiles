#!/bin/bash

[[ $- != *i* ]] && return

set -o emacs

shopt -s cdspell checkjobs checkwinsize dirspell extdebug globstar histappend histreedit histverify hostcomplete shift_verbose

PS1="\[\e]2;\u@\h: \W\a\e[1;32m\][\u@\h \W]\$ \[\e[0m\]"

[ -r /usr/share/bash-completion/bash_completion ] && \
    source /usr/share/bash-completion/bash_completion
[ -r /usr/share/git/completion/git-completion.bash ] && \
    source /usr/share/git/completion/git-completion.bash
[ -r "${XDG_CONFIG_HOME}"/gh/gh-completion.bash ] && \
    source "${XDG_CONFIG_HOME}"/gh/gh-completion.bash

source "${HOME}"/.bash_aliases
source "${HOME}"/.bash_functions

if [ "$(hostname)" == "raspberrypi" ]; then
    source "${HOME}"/.pi_aliases
elif [ "$(hostname)" == "localhost" ]; then
    source "${HOME}"/.termux_aliases
fi
