.PHONY: help
help:
	@sed -ne '/@sed/!s/## //p' $(MAKEFILE_LIST)

### ASDF

.PHONY: asdf-plugins-add-all
asdf-plugins-add-all:	## Install all asdf plugins from .plugin-versions file
	mkdir -p .asdf/plugins
	asdf-plugin-manager list | while read -r name url commit; do \
		git submodule add --name $$name $$url .asdf/plugins/$$name; \
	done

.PHONY: asdf-plugins-export
asdf-plugins-export:	## Export all current versions of asdf plugins to .plugin-versions file
	asdf-plugin-manager export > .plugin-versions

.PHONY: asdf-plugins-update
asdf-plugins-update: 	## Update all asdf plugins
	echo "Nope, let Renovate upgrade ASDF plugins"

.PHONY: asdf-plugins-reset
asdf-plugins-reset: 	## Reset all asdf plugins to the versions specified in .plugin-versions file
	asdf-plugin-manager list | while read -r name url commit; do \
		pushd .asdf/plugins/$$name; git checkout $$commit; popd; \
	done
	git add .asdf/plugins

.PHONY: asdf-plugins-restore
asdf-plugins-restore: 	## Initialize git submodules (for asdf plugins)
	git submodule update --init --recursive

.PHONY: asdf-plugins-symlink
asdf-plugins-symlink:	## Symlink asdf plugins
	echo ln -sfn $(PWD)/.asdf/plugins/* $(HOME)/.asdf/plugins

### HOMEBREW

# Check if all dependencies are installed
.PHONY: brewfile-check
brewfile-check:
	brew bundle check --verbose

# Dump all installed packages to Brewfile
.PHONY: brewfile-dump
brewfile-dump:
	brew bundle dump --force --all

# Install all packages from Brewfile
.PHONY: brewfile-install
brewfile-install:
	brew bundle install
