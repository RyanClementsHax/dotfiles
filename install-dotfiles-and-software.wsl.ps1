wsl.exe --set-default-version 2
wsl.exe --set-default Ubuntu
wsl.exe --set-version Ubuntu 2
wsl.exe bash -c "cd ~ && \
git clone -c credential.helper='/mnt/c/Program\\ Files/Git/mingw64/libexec/git-core/git-credential-manager.exe' https://github.com/RyanClementsHax/dotfiles.git && \
cd dotfiles && git config --unset credential.helper && \
bash install-dotfiles.wsl.bash && \
bash install-software.wsl.bash"
