#!/bin/bash

# I like mounting at /c instead of /mnt/c and this is part of that setup
sudo sh -c 'echo "$SUDO_USER ALL=(root) NOPASSWD: /bin/mount" >> /etc/sudoers'
sudo mkdir /c
sudo mount --bind /mnt/c /c

# Make the mount config "stick" - https://emerle.dev/2022/07/18/wsl-and-windows-filesystem/
sudo touch /etc/wsl.conf
sudo bash -c 'cat > /etc/wsl.conf <<_EOF
[automount]
options = "metadata,umask=22,fmask=11"
_EOF'