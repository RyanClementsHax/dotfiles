#!/bin/bash

echo
echo "--------------"
echo "Installing NVM"
echo "--------------"
echo

# https://docs.microsoft.com/en-us/windows/nodejs/setup-on-wsl2#install-nvm-nodejs-and-npm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
export NVM_DIR=/home/$USER/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

echo
echo "---------------"
echo "Installing Node"
echo "---------------"
echo

nvm install node
nvm install --lts

echo
echo "---------------"
echo "Installing Yarn"
echo "---------------"
echo

# https://classic.yarnpkg.com/en/docs/install#windows-stable
curl -o- -L https://yarnpkg.com/install.sh | bash
