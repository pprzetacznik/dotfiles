

function install_python_rhel () {
  sudo dnf install python-devel
  sudo dnf install -y cmake gcc-c++ make python3-devel
  sudo pip install --upgrade pip
  pip install virtualenv virtualenvwrapper
}

function install_packages () {
  dnf install git vim
}

function install_swapfile () {
  # https://btrfs.readthedocs.io/en/latest/btrfs-man5.html#swapfile-support
  # cat /proc/swaps
  btrfs filesystem mkswapfile --size 2G swapfile
  swapon swapfile
  echo "/swapfile swap swap defaults 0 0" | sudo tee -a /etc/fstab
}
