#!/bin/bash

export ALTERNATE_EDITOR="/usr/bin/emacs --daemon"
export BROWSER="/usr/bin/elinks -remote"
# export BROWSER="/usr/bin/firefox --private-window"
# export BROWSER="/usr/bin/w3m -T text/html"
# export CSCOPE_EDITOR=/usr/bin/vim
# export DISPLAY=:0.0
export EDITOR="/usr/bin/emacsclient -t"
export HISTCONTROL=ignoreboth
# export HISTFILE=${XDG_STATE_HOME}/bash/history
export HISTFILESIZE=65535
export HISTSIZE=65535
# export LESSGLOBALTAGS=/usr/bin/global
export LESSHISTFILE=-
export MAIL=${HOME}/Mail
export PAGER=/usr/bin/less
export SUDO_EDITOR="${EDITOR}"
export TERM=rxvt-unicode-256color
export VISUAL="/usr/bin/emacsclient -c"

# https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
export XDG_CACHE_HOME=${HOME}/.cache
export XDG_CONFIG_HOME=${HOME}/.config
export XDG_DATA_HOME=${HOME}/.local/share
# export XDG_RUNTIME_DIR=/run/user/$(id -u)
export XDG_STATE_HOME=${HOME}/.local/state
export XDG_CONFIG_DIRS=/etc/xdg
export XDG_DATA_DIRS=/usr/local/share:/usr/share

# https://www.freedesktop.org/wiki/Software/xdg-user-dirs/
# source ${XDG_CONFIG_HOME}/user-dirs.dirs
export XDG_DESKTOP_DIR=${USER_DIRS}/Desktop
export XDG_DOCUMENTS_DIR=${USER_DIRS}/Documents
export XDG_DOWNLOAD_DIR=${HOME}/Downloads
export XDG_MUSIC_DIR=${KODI_DIRS}/Music
export XDG_PICTURES_DIR=${USER_DIRS}/Pictures
export XDG_PUBLICSHARE_DIR=${USER_DIRS}/Public
export XDG_TEMPLATES_DIR=${USER_DIRS}/Templates
export XDG_VIDEOS_DIR=${KODI_DIRS}/Videos

# https://wiki.archlinux.org/title/XDG_Base_Directory
# export GNUPGHOME=${XDG_DATA_HOME}/gnupg

export INFOPATH=${XDG_DATA_HOME}/info:${INFOPATH}
export MANPATH=${XDG_DATA_HOME}/man:${MANPATH}

if [ "$(hostname)" == "secret" ]; then
    source "${HOME}"/.bash_secrets
    eval "$(/usr/bin/keychain --absolute --dir "${XDG_RUNTIME_DIR}"/keychain --eval ~/.ssh/id_ecdsa ${GPG_KEYID})"
fi

source "${HOME}"/.bashrc

stty -ixon
ulimit -c unlimited
umask 0077
