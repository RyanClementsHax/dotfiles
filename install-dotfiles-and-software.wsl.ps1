wsl.exe --set-default-version 2
wsl.exe --set-default Ubuntu
wsl.exe --set-version Ubuntu 2
wsl.exe bash -c "sudo chmod 600 /mnt/c/.ssh/* && \
sudo chmod 644 /mnt/c/.ssh/*.pub && \
sudo chmod 644 /mnt/c/.ssh/known_hosts && \
cp -r /mnt/c/.ssh ~/.ssh && \
sudo chmod 600 ~/.ssh/* && \
cd ~/dev && \
git clone -c credential.helper='/mnt/c/Program\\ Files/Git/mingw64/libexec/git-core/git-credential-manager.exe' https://github.com/RyanClementsHax/dotfiles.git && \
cd dotfiles && git config --unset credential.helper && \
bash install-dotfiles.wsl.bash && \
bash install-software.wsl.bash"
