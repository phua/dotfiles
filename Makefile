STOW=stow --simulate --verbose

XDG_CACHE_HOME=${HOME}/.cache
XDG_CONFIG_HOME=${HOME}/.config
XDG_DATA_HOME=${HOME}/.local/share
XDG_STATE_HOME=${HOME}/.local/state

.PHONY: all configure check install reinstall uninstall

all: configure check install

configure:
	mkdir -p $(XDG_CACHE_HOME) $(XDG_CONFIG_HOME) $(XDG_DATA_HOME) $(XDG_STATE_HOME)

check:
	chkstow --target=${HOME}
	chkstow --target=$(XDG_CACHE_HOME)
	chkstow --target=$(XDG_CONFIG_HOME)
	chkstow --target=$(XDG_DATA_HOME)
	chkstow --target=$(XDG_STATE_HOME)

install:
	$(STOW) --dir=. --target=${HOME} --dotfiles \
		bash \
		emacs \
		gnupg \
		mail \
		offlineimap \
		slrn \
		ssh \
		w3m \
		X11 \
		\
		gh \
		git \
		xdg-user-dirs

reinstall:
	make STOW="$(STOW) -R" install

uninstall:
	make STOW="$(STOW) -D" install
