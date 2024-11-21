### ASDF

# Install all asdf plugins from .plugin-versions file
.PHONY: asdf-plugin-manager-add-all
asdf-plugin-manager-add-all:
	asdf-plugin-manager add-all

# Export all current versions of asdf plugins to .plugin-versions file
.PHONY: asdf-plugin-manager-export
asdf-plugin-manager-export:
	asdf-plugin-manager export > .plugin-versions

# Update all asdf plugins
.PHONY: asdf-plugin-update-all
asdf-plugin-update-all:
	echo "Nope, let Renovate upgrade ASDF plugins"

# Git submodule each asdf plugin from .plugin-versions file
.PHONY: asdf-plugin-manager-submodules-init
asdf-plugin-manager-submodules-init:
	mkdir -p .asdf/plugins
	asdf-plugin-manager list | while read -r name url commit; do \
		git submodule add --name $$name $$url .asdf/plugins/$$name; \
	done

.PHONY: asdf-plugin-manager-submodules-reset
asdf-plugin-manager-submodules-reset:
	asdf-plugin-manager list | while read -r name url commit; do \
		pushd .asdf/plugins/$$name; echo git checkout $$commit; popd; \
	done

# Initialize git submodules (for asdf plugins)
.PHONY: asdf-plugin-manager-submodules-update
asdf-plugin-manager-submodules-update:
	git submodule update --init --recursive

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
