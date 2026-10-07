#!/usr/bin/env bash
#
# Entry point for GitHub Codespaces dotfiles (and other Linux machines), see:
# https://docs.github.com/en/codespaces/setting-your-user-preferences/personalizing-github-codespaces-for-your-account#dotfiles
#
# Non-interactive and safe to re-run. On macOS, follow README.md instead.

set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [[ "$(uname -s)" == Darwin ]]; then
  echo "On macOS, follow the steps in README.md instead." >&2
  exit 1
fi

# Symlink ~/$1 to $DOTFILES/$1, moving an existing (non-symlink) file aside first
link() {
  local src="$DOTFILES/$1" dst="$HOME/$1"
  mkdir -p "$(dirname "$dst")"
  if [[ -e "$dst" && ! -L "$dst" ]]; then
    mv "$dst" "$dst.pre-dotfiles.$(date +%s)"
  fi
  ln -sfn "$src" "$dst"
  echo "Linked ~/$1"
}

### Symlinks

for f in \
  .gitignore \
  .tmux.conf \
  .vimrc \
  .claude/skills \
  .agents/skills; do
  link "$f"
done

### Git

# Include (rather than replace) ~/.gitconfig, keeping what Codespaces configures in it
if ! git config --global --get-all include.path | grep -qxF "$DOTFILES/.gitconfig"; then
  git config --global --add include.path "$DOTFILES/.gitconfig"
  echo "Included $DOTFILES/.gitconfig from ~/.gitconfig"
fi

echo "Done installing dotfiles from $DOTFILES"
