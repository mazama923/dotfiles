.PHONY: all install_brew deploy_dotfiles brew_install sudo_local set_fish_shell install_rust export_brew update_bat_theme install_kafkactl speed_dock

all: install_brew deploy_dotfiles brew_install sudo_local set_fish_shell install_rust update_bat_theme install_kafkactl speed_dock

install_brew:
	/bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

deploy_dotfiles:
	brew install stow
	stow */

brew_install:
	brew bundle
	mkdir -p $${HOME}/Library/LaunchAgents
	brew autoupdate delete
	brew autoupdate start 43200 --upgrade --cleanup --immediate --sudo

sudo_local:
	echo "# sudo_local: local config file which survives system update and is included for sudo" | sudo tee /etc/pam.d/sudo_local
	echo "# uncomment following line to enable Touch ID for sudo" | sudo tee -a /etc/pam.d/sudo_local
	echo "auth       sufficient     pam_tid.so" | sudo tee -a /etc/pam.d/sudo_local

set_fish_shell:
	@command -v fish >/dev/null 2>&1 || (echo "Fish shell not installed!" && exit 1)
	@grep -q "$$(command -v fish)" /etc/shells || echo "$$(command -v fish)" | sudo tee -a /etc/shells
	chsh -s "$$(command -v fish)"

install_rust:
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

update_bat_theme:
	bat cache --build

install_kafkactl:
	curl -L https://github.com/michelin/kafkactl/releases/download/v1.17.0/kafkactl-1.17.0-darwin-arm64 -o kafkactl
	sudo mkdir -p /usr/local/bin/
	sudo mv kafkactl /usr/local/bin/kafkactl
	sudo chown root /usr/local/bin/kafkactl
	sudo chmod 755 /usr/local/bin/kafkactl

speed_dock:
	defaults write com.apple.dock autohide-delay -float 0
	defaults write com.apple.dock autohide-time-modifier -float 0.4; killall Dock

export_brew:
	brew bundle dump --describe --force
