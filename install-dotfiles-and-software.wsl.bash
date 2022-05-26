wsl.exe --set-default-version 2
wsl.exe --set-default Ubuntu
wsl.exe --set-version Ubuntu 2
wsl.exe bash -c "
mkdir ~/dev && \
cd ~/dev && \
git clone https://github.com/RyanClementsHax/dotfiles.git && \
cd dotfiles && \
bash install-dotfiles.wsl.bash && \
bash install-software.wsl.bash"
