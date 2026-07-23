# Make tab-completion work without errors (command not found: compdef)
autoload -Uz compinit && compinit

# Antidote: source a statically-generated plugin bundle for fast startup,
# regenerating it only when the plugin list (~/.zsh_plugins.txt) changes.
# See: https://getantidote.github.io/usage#static
zsh_plugins=${ZDOTDIR:-$HOME}/.zsh_plugins
if [[ ! ${zsh_plugins}.zsh -nt ${zsh_plugins}.txt ]]; then
	for antidote_dir in /opt/homebrew/opt/antidote /usr/local/opt/antidote; do
		if [ -f "${antidote_dir}/share/antidote/antidote.zsh" ]; then
			source "${antidote_dir}/share/antidote/antidote.zsh"
			antidote bundle <"${zsh_plugins}.txt" >"${zsh_plugins}.zsh"
			break
		fi
	done
fi
[ -f "${zsh_plugins}.zsh" ] && source "${zsh_plugins}.zsh"

# Starship
eval "$(starship init zsh)"

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{exports,aliases}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# iTerm2 "shell integration", see:
# https://iterm2.com/shell_integration/install_shell_integration_and_utilities.sh
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

function iterm2_print_user_vars() {
  iterm2_set_user_var starship "$(starship prompt)"
}

export ZSH_THEME_TERM_TITLE_IDLE="%~"

# 1Password CLI plugins
[ -f ~/.config/op/plugins.sh ] && source ~/.config/op/plugins.sh

# Source local extra (private) settings specific to machine if it exists
[ -f ~/.zsh.local ] && source ~/.zsh.local

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
