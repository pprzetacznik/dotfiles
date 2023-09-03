# Dotfiles
## Install vim configuration

### Installation script

```
./install.sh swapfile
./install.sh rhel
./install.sh vim
./install.sh ycm_rhel
./install.sh links
```

### mintty

```
cp mintty/themes/solarized AppData/Local/wsltty/usr/share/mintty/themes/solarized
```

### Tips

```
sudo usermod -aG sudo username # ubuntu
sudo usermod -aG wheel username # fedora
# sudo visudo
%wheel  ALL=(ALL)       NOPASSWD: ALL
```

```
:w !sudo tee %
```

