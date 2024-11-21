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
	asdf plugin update --all

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
