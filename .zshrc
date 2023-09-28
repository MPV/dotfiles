# Make tab-completion work without errors (command not found: compdef)
autoload -Uz compinit && compinit

source /usr/local/opt/antidote/share/antidote/antidote.zsh
antidote load

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

# Source local extra (private) settings specific to machine if it exists
[ -f ~/.zsh.local ] && source ~/.zsh.local

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
