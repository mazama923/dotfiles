.PHONY: all install_brew deploy_dotfiles brew_install sudo_local set_fish_shell install_rust export_brew update_bat_theme install_kafkactl speed_dock

BREW = $(shell if command -v brew >/dev/null 2>&1; then command -v brew; elif test -x /opt/homebrew/bin/brew; then echo /opt/homebrew/bin/brew; elif test -x /usr/local/bin/brew; then echo /usr/local/bin/brew; fi)
BREW_PREFIX = $(patsubst %/bin/brew,%,$(BREW))

all: install_brew deploy_dotfiles brew_install sudo_local set_fish_shell install_rust update_bat_theme install_kafkactl speed_dock

install_brew:
	/bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

deploy_dotfiles:
	$(BREW) install stow
	PATH="$(BREW_PREFIX)/bin:$(BREW_PREFIX)/sbin:$$PATH" stow */

brew_install:
	$(BREW) bundle
	mkdir -p $${HOME}/Library/LaunchAgents
	$(BREW) autoupdate delete
	$(BREW) autoupdate start 43200 --upgrade --cleanup --immediate --sudo

sudo_local:
	@if [ -e /etc/pam.d/sudo_local ]; then \
		echo "/etc/pam.d/sudo_local already exists; leaving it unchanged."; \
	else \
		printf '%s\n' \
			"# sudo_local: local config file which survives system updates." \
			"# Touch ID is enabled for sudo by the following rule." \
			"auth       sufficient     pam_tid.so" | sudo tee /etc/pam.d/sudo_local >/dev/null; \
	fi

set_fish_shell:
	@PATH="$(BREW_PREFIX)/bin:$(BREW_PREFIX)/sbin:$$PATH"; export PATH; \
	fish_path=$$(command -v fish) && \
	{ grep -q "$$fish_path" /etc/shells || echo "$$fish_path" | sudo tee -a /etc/shells >/dev/null; } && \
	chsh -s "$$fish_path"

install_rust:
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

update_bat_theme:
	@PATH="$(BREW_PREFIX)/bin:$(BREW_PREFIX)/sbin:$$PATH"; export PATH; \
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
	$(BREW) bundle dump --describe --force
