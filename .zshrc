source /usr/local/share/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle asdf
antigen bundle command-not-found
antigen bundle docker
antigen bundle gcloud
antigen bundle git
antigen bundle helm
antigen bundle kubectl
antigen bundle terraform
#antigen bundle per-directory-history # https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins#per-directory-history

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions

# Load the theme.
#antigen theme cloud
#antigen theme denysdovhan/spaceship-prompt
antigen theme dracula/zsh dracula

# Tell Antigen that you're done.
antigen apply

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
