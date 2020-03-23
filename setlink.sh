#!/bin/bash

DOTFILES_DIR=$(cd $(dirname $0); pwd)
echo $DOTFILES_DIR

ln -sf $DOTFILES_DIR/.bashrc ~/.bashrc
ln -sf $DOTFILES_DIR/.bash_profile ~/.bash_profile
ln -sf $DOTFILES_DIR/.bash_aliases ~/.bash_aliases
ln -sf $DOTFILES_DIR/.inputrc ~/.inputrc
ln -sf $DOTFILES_DIR/.vimrc ~/.vimrc
ln -sf $DOTFILES_DIR/.tmux.conf ~/.tmux.conf
source .bash_profile
source .bashrc
source .inputrc
