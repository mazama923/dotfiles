.PHONY: all install_brew brew_install sudo_local set_fish_shell

all: install_brew brew_install sudo_local set_fish_shell

install_brew:
	/bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew_install:
	brew bundle

sudo_local:
	echo "# sudo_local: local config file which survives system update and is included for sudo" | sudo tee /etc/pam.d/sudo_local
	echo "# uncomment following line to enable Touch ID for sudo" | sudo tee -a /etc/pam.d/sudo_local
	echo "auth       sufficient     pam_tid.so" | sudo tee -a /etc/pam.d/sudo_local

set_fish_shell:
	@which fish | grep -q "$$(cat /etc/shells)" || echo $$(which fish) | sudo tee -a /etc/shells
	chsh -s $$(which fish)

