#!/bin/bash

set -ex

# ----------------------------------------------------------------------
# Copy configuration files
# ----------------------------------------------------------------------
cp ./config/tmux.conf $HOME/.tmux.conf

cp ./config/zshrc $HOME/.zshrc
cp ./config/p10k.zsh $HOME/.p10k.zsh

cp ./config/git/gitconfig $HOME/.gitconfig
cp ./config/git/gitmessage $HOME/.gitmessage
cp ./config/git/gitignore_global $HOME/.gitignore_global

