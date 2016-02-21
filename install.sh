#!/bin/bash
HOMEDIR=${1:-/home/$USER}/
echo "Setting up dotfiles into $HOMEDIR"

mkdir -pv $HOMEDIR/.vim/bundle

echo "Set up symlinks to $HOMEDIR"
ln -sv $PWD/.vimrc $HOMEDIR 
ln -sv $PWD/.zshrc $HOMEDIR
ln -sv $PWD/snippets $HOMEDIR/.vim/

echo "Cloning Vundle repo into $HOMEDIR/.vim/bundle/Vundle.vim"
git clone https://github.com/VundleVim/Vundle.vim.git $HOMEDIR/.vim/bundle/Vundle.vim

echo "Installing vim plugins using Vundle"
vim +PluginInstall +qall

