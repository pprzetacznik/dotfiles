#!/bin/bash

set -xe

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

mkdir ~/.vim/colors
cp ~/.vim/bundle/vim-colors-solarized/colors/solarized.vim ~/.vim/colors/solarized.vim

pushd ~/.vim/bundle/YouCompleteMe
python install.py --all
popd

SYSTEM=${1:-redhat}

case $SYSTEM in
  ubuntu)
    ln -s $(pwd)/.profile.sh ~/.profile.sh
    ;;
  redhat)
    ln -s $(pwd)/.bashrc ~/.bashrc
    ;;
esac

ln -s $(pwd)/.vimrc ~/.vimrc
ln -s $(pwd)/.tmux.conf ~/.tmux.conf
ln -s $(pwd)/.screenrc ~/.screenrc
ln -s $(pwd)/.inputrc ~/.inputrc
ln -s $(pwd)/.dircolors ~/.dircolors
ln -s $(pwd)/.emacs ~/.emacs
ln -s $(pwd)/.eslintrc ~/.eslintrc

