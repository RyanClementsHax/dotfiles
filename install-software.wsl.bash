#!/bin/bash

###############################################################################################################################
# personal shell preferences ##################################################################################################
###############################################################################################################################

# oh-my-zsh - https://ohmyz.sh/
sudo apt-get install -y zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --keep-zshrc
# Enter password for changing default shell

# I like mounting at /c instead of /mnt/c and this is part of that setup
sudo sh -c 'echo "$SUDO_USER ALL=(root) NOPASSWD: /bin/mount" >> /etc/sudoers'
sudo mkdir /c
sudo mount --bind /mnt/c /c

###############################################################################################################################
# package managers ############################################################################################################
###############################################################################################################################

# nvm (npm, Node.js, etc.) - https://docs.microsoft.com/en-us/windows/nodejs/setup-on-wsl2#install-nvm-nodejs-and-npm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
export NVM_DIR=/home/$USER/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm install node
nvm install --lts

# yarn - https://classic.yarnpkg.com/en/docs/install/#debian-stable
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update
sudo apt-get install -y yarn

###############################################################################################################################
# cli #########################################################################################################################
###############################################################################################################################

# azure-cli - https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-apt?view=azure-cli-latest
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

###############################################################################################################################
# languages ###################################################################################################################
###############################################################################################################################

# dotnet - https://docs.microsoft.com/en-us/dotnet/core/install/linux#ubuntu
wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb
sudo apt-get update
# sudo apt-get install -y apt-transport-https && \
# sudo apt-get update
sudo apt-get install -y dotnet-sdk-3.1 # donet core 3.1
sudo apt-get install -y dotnet-sdk-5.0 # dotnet 5.0

# make sure to set the JAVA_HOME env var in your path in your profile

# java - https://ubuntu.com/tutorials/install-jre#1-overview
sudo apt install openjdk-13-jre # java 13

###############################################################################################################################
# cypress #####################################################################################################################
###############################################################################################################################

# to get cypress to work
apt-get install libgtk2.0-0 libgtk-3-0 libgbm-dev libnotify-dev libgconf-2-4 libnss3 libxss1 libasound2 libxtst6 xauth xvfb -y
# installing chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt -y install ./google-chrome-stable_current_amd64.deb
rm ./google-chrome-stable_current_amd64.deb

###############################################################################################################################
# misc ########################################################################################################################
###############################################################################################################################

sudo touch /etc/wsl.conf
sudo bash -c 'cat > /etc/wsl.conf <<_EOF
[automount]
options = "metadata,umask=22,fmask=11"
_EOF'

chsh -s /bin/zsh
exec zsh -l
