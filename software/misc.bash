#!/bin/bash

echo
echo "---------------"
echo "Installing Misc"
echo "---------------"
echo

sudo apt-get -y install zip
sudo apt-get -y install unzip

# Add emoji font 🤩
sudo apt-get install fonts-noto-color-emoji -y

# To get puppeteer to work
# https://github.com/puppeteer/puppeteer/issues/6192
# https://askubuntu.com/questions/547151/error-while-loading-shared-libraries-libxss-so-1
sudo apt-get install libxss1