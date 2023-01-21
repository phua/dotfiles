#!/bin/bash

export ALTERNATE_EDITOR="/usr/bin/emacs --daemon"
export BROWSER="/usr/bin/elinks -remote"
export CSCOPE_EDITOR=/usr/bin/vim
# export DISPLAY=:0.0
export EDITOR="/usr/bin/emacsclient -t"
export HISTCONTROL=ignoreboth
export HISTFILESIZE=65535
export HISTSIZE=65535
export LESSGLOBALTAGS=/usr/bin/global
export LESSHISTFILE=-
export MAIL=${HOME}/Mail
export PAGER=/usr/bin/less
export SUDO_EDITOR=${EDITOR}
export TERM=rxvt-unicode-256color
export VISUAL="/usr/bin/emacsclient -c"

export WORKSPACE_HOME=${HOME}/workspace
export USER_DIRS=${WORKSPACE_HOME}/user-dirs
export MEDIA_DIR=${HOME}/.local/mnt/media/Media

# https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
export XDG_CACHE_HOME=${HOME}/.cache
export XDG_CONFIG_HOME=${HOME}/.config
export XDG_DATA_HOME=${HOME}/.local/share
export _XDG_EXEC_HOME=${HOME}/.local/bin
# export XDG_RUNTIME_DIR=/run/user/$(id -u)
export XDG_STATE_HOME=${HOME}/.local/state
export XDG_CONFIG_DIRS=/etc/xdg
export XDG_DATA_DIRS=/usr/local/share:/usr/share

# https://www.freedesktop.org/wiki/Software/xdg-user-dirs/
export XDG_DESKTOP_DIR=${HOME}/Desktop
export XDG_DOCUMENTS_DIR=${USER_DIRS}/Documents
export XDG_DOWNLOAD_DIR=${HOME}/Downloads
export XDG_MUSIC_DIR=${MEDIA_DIR}/Music
export XDG_PICTURES_DIR=${MEDIA_DIR}/Pictures
export XDG_PUBLICSHARE_DIR=${USER_DIRS}/Public
export XDG_TEMPLATES_DIR=${USER_DIRS}/Templates
export XDG_VIDEOS_DIR=${MEDIA_DIR}/Videos
export _XDG_BOOKS_DIR=${MEDIA_DIR}/Books
export _XDG_GAMES_DIR=${MEDIA_DIR}/Games
export _XDG_MOVIES_DIR=${MEDIA_DIR}/Movies
export _XDG_MUSICVIDEOS_DIR="${MEDIA_DIR}/Music Videos"
export _XDG_PRIVATE_DIR=${USER_DIRS}/Private
export _XDG_TRASH_DIR=${HOME}/Trash
export _XDG_TVSHOWS_DIR="${MEDIA_DIR}/TV Shows"

# https://wiki.archlinux.org/title/XDG_Base_Directory
export ELINKS_CONFDIR=${XDG_CONFIG_HOME}/elinks
export GDBHISTFILE=${XDG_DATA_HOME}/gdb/history
# export GNUPGHOME=${XDG_DATA_HOME}/gnupg
# export GOCACHE=${XDG_CACHE_HOME}/go-build
# export GOMODCACHE=${GOPATH}/pkg/mod
export GOPATH=${XDG_DATA_HOME}/go
export ICEAUTHORITY=${XDG_CACHE_HOME}/ICEauthority
export INPUTRC=${XDG_CONFIG_HOME}/readline/inputrc
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot=${XDG_CONFIG_HOME}/java
export JULIA_DEPOT_PATH=${XDG_DATA_HOME}/julia:${JULIA_DEPOT_PATH}
export JUPYTER_CONFIG_DIR=${XDG_CONFIG_HOME}/jupyter
export MPLAYER_HOME=${XDG_CONFIG_HOME}/mplayer
export NETRC=${XDG_CONFIG_HOME}/netrc
export OCTAVE_HISTFILE=${XDG_CACHE_HOME}/octave_hist
export OCTAVE_SITE_INITFILE=${XDG_CONFIG_HOME}/octave/octaverc
export PARALLEL_HOME=${XDG_CONFIG_HOME}/parallel
export PYLINTHOME=${XDG_CACHE_HOME}/pylint
export PYLINTRC=${XDG_CONFIG_HOME}/pylint/pylintrc
export PYTHON_EGG_CACHE=${XDG_CACHE_HOME}/python-eggs
export PYTHONPYCACHEPREFIX=${XDG_CACHE_HOME}/python
export PYTHONUSERBASE=${XDG_DATA_HOME}/python
export RANDFILE=${XDG_DATA_HOME}/rnd
export RLWRAP_HOME=${XDG_DATA_HOME}/rlwrap
export R_PROFILE=${XDG_CONFIG_HOME}/r/Rprofile
export SBCL_HOME=${XDG_CONFIG_HOME}/sbcl
export SCREENRC=${XDG_CONFIG_HOME}/screen/screenrc
export SQLITE_HISTORY=${XDG_DATA_HOME}/sqlite3/sqlite_history
export TEXMFCONFIG=${XDG_CONFIG_HOME}/texlive/texmf-config
export TEXMFHOME=${XDG_DATA_HOME}/texmf
export TEXMFVAR=${XDG_CACHE_HOME}/texlive/texmf-var
export VIMINIT=":source ${XDG_CONFIG_HOME}/vim/vimrc"
export WGETRC=${XDG_CONFIG_HOME}/wgetrc
export WWW_HOME=${XDG_PUBLICSHARE_DIR}/public_html/www
export XAUTHORITY=${XDG_RUNTIME_DIR}/Xauthority
export XINITRC=${XDG_CONFIG_HOME}/X11/xinitrc
export XSERVERRC=${XDG_CONFIG_HOME}/X11/xserverrc

export INFOPATH=${XDG_DATA_HOME}/../share/info:${INFOPATH}
export LD_LIBRARY_PATH=${XDG_DATA_HOME}/../lib:${LD_LIBRARY_PATH}
export MANPATH=${XDG_DATA_HOME}/../share/man:${MANPATH}
export PATH=${XDG_DATA_HOME}/../scripts:${_XDG_EXEC_HOME}:${PATH}

source "${HOME}"/.bash_secrets

if [ "$(hostname)" == "aleph2" ]; then
    eval "$(/usr/bin/keychain --absolute --dir "${XDG_RUNTIME_DIR}"/keychain --eval --agents ssh,gpg ~/.ssh/id_ecdsa ${GPG_KEYID})"
fi

source "${HOME}"/.bashrc

umask 077
ulimit -c unlimited
stty -ixon
