#!/bin/bash

set -xe


function install_python_rhel () {
  sudo yum install python-devel
  sudo pip install --upgrade pip
  pip install virtualenv virtualenvwrapper
}

function install_python_ubuntu () {
  sudo apt install python3-venv ctags
}

function install_vim () {
  sudo yum install -y vim the_silver_searcher

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
  sudo yum install -y tmux
}

function install_git_rhel () {
  sudo yum install -y git
  ln -sf $(pwd)/.gitconfig ~/.gitconfig
}

function install_swapfile () {
  sudo dd if=/dev/zero of=/swapfile bs=1024 count=2097152
  sudo mkswap /swapfile
  sudo swapon /swapfile
  echo "/swapfile swap swap defaults 0 0" | sudo tee -a /etc/fstab
}

function install_openjdk () {
  wget https://download.java.net/java/GA/jdk14/076bab302c7b4508975440c56f6cc26a/36/GPL/openjdk-14_linux-x64_bin.tar.gz
  tar xvf openjdk-14_linux-x64_bin.tar.gz
  sudo mv jdk-14 /opt/
  sudo tee /etc/profile.d/jdk14.sh <<EOF
export JAVA_HOME=/opt/jdk-14
export PATH=\$PATH:\$JAVA_HOME/bin
EOF
  source /etc/profile.d/jdk14.sh
  rm openjdk-14_linux-x64_bin.tar.gz
}

JOB=${1:-rhel}

case $JOB in
  ubuntu)
    ln -sf $(pwd)/.profile.sh ~/.profile.sh
    install_vim
    install_links
    ;;
  rhel)
    ln -sf $(pwd)/.bash_profile ~/.bash_profile
    install_python_rhel
    install_vim
    install_links
    install_tmux_rhel
    install_ycm_rhel
    ;;
  swapfile)
    install_swapfile
    ;;
  vim)
    install_vim
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
  tmux)
    install_tmux_rhel
    ;;
  openjdk)
    install_openjdk
    ;;
esac
