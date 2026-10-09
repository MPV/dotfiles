# Make tab-completion work without errors (command not found: compdef).
# Only rebuild the completion dump (and run its security check) once a day;
# every other startup reuses the cache via `compinit -C` for faster shells.
autoload -Uz compinit
if [[ -n ${ZDOTDIR:-$HOME}/.zcompdump(#qN.mh+24) ]]; then
	compinit
else
	compinit -C
fi

[ -f /usr/local/opt/antidote/share/antidote/antidote.zsh ] && source /usr/local/opt/antidote/share/antidote/antidote.zsh
[ -f /opt/homebrew/opt/antidote/share/antidote/antidote.zsh ] && source /opt/homebrew/opt/antidote/share/antidote/antidote.zsh
# Non-Homebrew installs (e.g. Linux / GitHub Codespaces), see: https://antidote.sh/install
[ -f ${ZDOTDIR:-$HOME}/.antidote/antidote.zsh ] && source ${ZDOTDIR:-$HOME}/.antidote/antidote.zsh
(( $+functions[antidote] )) && antidote load

# Starship
command -v starship >/dev/null && eval "$(starship init zsh)"

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

# pnpm
if [[ "$OSTYPE" == darwin* ]]; then
  export PNPM_HOME="$HOME/Library/pnpm"
else
  export PNPM_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/pnpm"
fi
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# local/manual zsh completions:
typeset -gaU fpath=($fpath ~/.local/share/zsh/completions)

