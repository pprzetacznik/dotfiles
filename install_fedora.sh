

function install_python_rhel () {
  sudo dnf install python-devel
  sudo dnf install -y cmake gcc-c++ make python3-devel
  sudo pip install --upgrade pip
  pip install virtualenv virtualenvwrapper
}

function install_git () {
  ln -sf $(pwd)/.gitconfig ~/.gitconfig
  dnf install git
}

function install_vim () {
  dnf install gvim
}

function install_links () {
  ln -sf $(pwd)/.screenrc ~/.screenrc
  ln -sf $(pwd)/.dircolors ~/.dircolors
  ln -sf $(pwd)/.emacs ~/.emacs
  ln -sf $(pwd)/.eslintrc ~/.eslintrc
}

function install_tmux_rhel () {
  ln -sf $(pwd)/.tmux.conf ~/.tmux.conf
  sudo dnf install -y tmux
}

function install_swapfile () {
  # https://btrfs.readthedocs.io/en/latest/btrfs-man5.html#swapfile-support
  # cat /proc/swaps
  btrfs filesystem mkswapfile --size 2G swapfile
  swapon swapfile
  echo "/swapfile swap swap defaults 0 0" | sudo tee -a /etc/fstab
}
