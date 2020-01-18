#!/bin/bash
ln -sf ~/Github/dotfiles/.bashrc ~/.bashrc
ln -sf ~/Github/dotfiles/.bash_profile ~/.bash_profile
ln -sf ~/Github/dotfiles/.bash_aliases ~/.bash_aliases
ln -sf ~/Github/dotfiles/.inputrc ~/.inputrc
ln -sf ~/Github/dotfiles/.vimrc ~/.vimrc
ln -sf ~/Github/dotfiles/.tmux.conf ~/.tmux.conf
source .bash_profile
source .bashrc
source .inputrc
