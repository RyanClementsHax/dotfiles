#!/bin/bash

sudo apt-get update

software_install_scripts_dir="software"

for fileName in `ls $software_install_scripts_dir`
do
  source $software_install_scripts_dir/$fileName
done

chsh -s /bin/zsh
exec zsh -l