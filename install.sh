#!/bin/bash

set -xe


function install_vimrc () {
  ln -sf $(pwd)/.vimrc ~/.vimrc
  ln -sf $(pwd)/.inputrc ~/.inputrc
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

  git clone https://github.com/altercation/vim-colors-solarized.git ~/.vim/bundle/vim-colors-solarized
  mkdir ~/.vim/colors
  cp ~/.vim/bundle/vim-colors-solarized/colors/solarized.vim ~/.vim/colors/solarized.vim

  git clone https://github.com/psf/black.git ~/.vim/bundle/black
  vim +slient +VimEnter +PluginInstall +qall

  source ~/.vim/black/bin/activate
  pip install --upgrade git+https://github.com/psf/black.git
  deactivate

  install_ycm_rhel
}

function install_ycm_rhel () {
  sudo dnf install -y cmake gcc-c++ make python3-devel
  pushd ~/.vim/bundle/YouCompleteMe
  # python install.py --all
  python install.py --clangd-completer
  popd
}

function install_links () {
  ln -sf $(pwd)/.screenrc ~/.screenrc
  ln -sf $(pwd)/.dircolors ~/.dircolors
  ln -sf $(pwd)/.emacs ~/.emacs
  ln -sf $(pwd)/.eslintrc ~/.eslintrc
}

function install_tmux_rhel () {
  ln -sf $(pwd)/.tmux.conf ~/.tmux.conf
  sudo yum intall -y tmux
}

function install_git_rhel () {
  sudo yum install -y git
  ln -sf $(pwd)/.gitconfig ~/.gitconfig
}

function install_swapfile () {
  sudo dd if=/dev/zero of=/swapfile bs=1024 count=65536
  sudo mkswap /swapfile
  sudo swapon /swapfile
  sudo echo "/swapfile swap swap defaults 0 0" >> /etc/fstab
}

JOB=${1:-rhel}

case $JOB in
  ubuntu)
    ln -sf $(pwd)/.profile.sh ~/.profile.sh
    install_vimrc
    install_links
    ;;
  rhel)
    ln -sf $(pwd)/.bashrc ~/.bashrc
    install_vimrc
    install_links
    install_tmux_rhel
    install_ycm_rhel
    ;;
  swapfile)
    install_swapfile
    ;;
  vim)
    install_vimrc
    ;;
  ycm_rhel)
    install_ycm_rhel
    ;;
  git_rhel)
    install_git_rhel
    ;;
  links)
    install_links
    ;;
esac
