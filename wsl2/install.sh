#!/bin/bash

set -ex

# ----------------------------------------------------------------------
# Copy configuration files
# ----------------------------------------------------------------------
cp ./config/tmux.conf $HOME/.tmux.conf

cp ./config/zshrc $HOME/.zshrc
cp ./config/p10k.zsh $HOME/.p10k.zsh

mkdir -p $HOME/.config/nvim/
cp ./config/nvim/vimrc $HOME/.vimrc
cp ./config/nvim/init.vim $HOME/.config/nvim/init.vim

cp ./config/git/gitconfig $HOME/.gitconfig
cp ./config/git/gitmessage $HOME/.gitmessage
cp ./config/git/gitignore_global $HOME/.gitignore_global

