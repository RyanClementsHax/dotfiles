#!/bin/bash

SCRIPTPATH=$(dirname $(readlink -f "$0") )

FILES=(
  .oh-my-zsh-custom
  .git-scripts
  .gitconfig
  .zshrc
)

for FILE in ${FILES[@]}; do
  if [[ ! ( -L "$HOME/$FILE" && $SCRIPTPATH/$FILE ==  $(readlink -f "$HOME/$FILE") ) ]]; then
    if [[ ( -f "$HOME/$FILE" || -d "$HOME/$FILE" ) ]]; then
      BACKUP=$HOME/$FILE.$(date +"%Y_%m_%d_%I_%M_%p").bak
      echo "Backing up $HOME/$FILE as $BACKUP"
      mv $HOME/$FILE $BACKUP
    fi

    echo "Linking $SCRIPTPATH/$FILE to $HOME/$FILE"
    ln -sf $SCRIPTPATH/$FILE ~/$FILE

  fi
done

chmod 700 -R $HOME/.git-scripts
# chmod -R 666 $HOME/.gitconfig
chmod 644 $HOME/.zshrc
