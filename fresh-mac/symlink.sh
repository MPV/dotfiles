#!/usr/bin/env bash -x

SCRIPT_PATH=$(dirname $(realpath -s $0))
PARENT_PATH=$(dirname ${SCRIPT_PATH})

cd ~
ln -s ${PARENT_PATH}/.aliases
ln -s ${PARENT_PATH}/.asdfrc
ln -s ${PARENT_PATH}/.exports
ln -s ${PARENT_PATH}/.gitconfig
ln -s ${PARENT_PATH}/.gitignore
ln -s ${PARENT_PATH}/.skhdrc
ln -s ${PARENT_PATH}/.vimrc
ln -s ${PARENT_PATH}/.yabairc
ln -s ${PARENT_PATH}/.zshrc
ln -s ${PARENT_PATH}/.config/starship.toml ~/.config/
ln -s ${PARENT_PATH}/.ssh/personal.include ~/.ssh/
ln -s ${PARENT_PATH}/Brewfile

