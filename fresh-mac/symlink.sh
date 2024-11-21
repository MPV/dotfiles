#!/usr/bin/env bash -x

SCRIPT_PATH=$(dirname $(realpath $0))
PARENT_PATH=$(dirname ${SCRIPT_PATH})

echo "Will symlink files from ${PARENT_PATH}"

cd ~
ln -is ${PARENT_PATH}/.aliases
ln -is ${PARENT_PATH}/.asdfrc
ln -is ${PARENT_PATH}/.exports
ln -is ${PARENT_PATH}/.gitconfig
ln -is ${PARENT_PATH}/.gitignore
ln -is ${PARENT_PATH}/.krewfile
ln -is ${PARENT_PATH}/.skhdrc
ln -is ${PARENT_PATH}/.vimrc
ln -is ${PARENT_PATH}/.yabairc
ln -is ${PARENT_PATH}/.zshrc
ln -is ${PARENT_PATH}/.zsh_plugins.txt
ln -is ${PARENT_PATH}/.config/starship.toml ~/.config/
ln -is ${PARENT_PATH}/.config/bitbar
ln -is ${PARENT_PATH}/.ssh/personal.include ~/.ssh/
ln -is ${PARENT_PATH}/.tmux
ln -is ${PARENT_PATH}/.tmux.conf
ln -is ${PARENT_PATH}/.tool-versions
ln -is ${PARENT_PATH}/.plugin-versions
ln -is ${PARENT_PATH}/Brewfile

