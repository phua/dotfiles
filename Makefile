# STOW=stow -nvv
STOW=stow

.PHONY: all configure install check reinstall uninstall

all: configure install check

configure:
	source bash/.bash_profile
	mkdir -p ${XDG_CACHE_HOME} ${XDG_CONFIG_HOME} ${XDG_DATA_HOME} ${XDG_STATE_HOME}
	mkdir -p ${XDG_DOWNLOAD_DIR} ${_XDG_TRASH_DIR}

install:
	$(STOW) -t ${HOME} bash emacs gnupg mail ssh term usenet
	$(STOW) -t ${XDG_CONFIG_HOME} config
	$(STOW) -t ${XDG_DATA_HOME}/.. local
	ln -s ${XDG_CONFIG_HOME}/X11/Xmodmap ${HOME}/.Xmodmap

check:
	chkstow -t ${HOME}
	chkstow -t ${XDG_CONFIG_HOME}
	chkstow -t ${XDG_DATA_HOME}/..

reinstall:
	make STOW="$(STOW) -R" install

uninstall:
	make STOW="$(STOW) -D" install
