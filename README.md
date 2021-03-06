# dotfiles

If anyone wants to use this repo that is not me, please fork it and change `ryanclementshax` everywhere to your own username.
Also, be sure to change to gitconfig to your own git config, but leave the `credential` section in place.
**NEVER** Commit back sesitive information within any file such as `.ssh`

## Main setup plan

1. Install WSL 2 on your machine [Official MS Docs](https://docs.microsoft.com/en-us/windows/wsl/install-win10)
1. Install these apps if they aren't already installed.
   - Windows Terminal
   - Ubuntu
     - Alternatively, you can side-load any `.tar.gz` root file system with `wsl --import`. See test script for example.
     - If you are upgrading your Ubuntu version to 20.04, run `do-release-upgrade` in the Ubuntu terminal (if you get authentication errors, try running `sudo apt-get install --reinstall ubuntu-keyring`, else consult Google)
     - You can check your version of Ubuntu by running `lsb_release -a` in the Ubuntu terminal
   - Windows Subsystem for Linux Update
   - Docker
1. If you already have Ubuntu on your machine, be sure to set its WSL version to 2 by running `wsl --set-version <image name> 2` in powershell
1. Open Ubuntu distro for the first time to set up username and password within distro. This is independent of Windows password but can be set the same.
   - To change your password later, run `passwd`.
1. Copy windows Terminal settings that you desire from [here](./windows-terminal/WindowsTerminalSettings.jsonc).
1. Might still need to install [Cascadia Code](https://docs.microsoft.com/en-us/windows/terminal/cascadia-code).
   - Configure VS Code to use correct font `"terminal.integrated.fontFamily": "Cascadia Code PL"`
1. I had issues previously with networking in WSL2 while on VPN. The issue seems to have fixed itself so just skip this step and move on.
   If you are having issues though, import `vpn/CiscoVPN-Network-Update.xml` as a scheduled task and copy `Cisco.ps1` to `C:\Users\<your user name>\Cisco.ps1`.
   [Relevant GitHub issue](https://github.com/microsoft/WSL/issues/4277#issuecomment-639460712)
1. If you use docker, configure docker to use WSL2 backend and support the newly set up distro
   1. Refer to their docs on how to do this
   1. Confirm docker is working with `docker ps`. If there are issues, close and reopen wsl and restart docker. That fixed my issues.
1. Run powershell file: `powershell.exe -executionpolicy bypass -file ./install-dotfiles-and-software.wsl.ps1`
   - When prompted, enter password. This will happen multiple times.
   - If this does not work, you can use manual instructions for dotfiles below.
1. If you want to install the windows specifc dotfiles on a windows specific terminal like git bash, then clone this repo on your windows file system and run `bash ./install-dotfiles.windows.bash` from the root directory of this project.
1. If your git credentials change per machine you set up these dotfiles on, be sure to update the `.gitconfig` in the home directory

## Manual instructions for configuring dotfiles

If the powershell script in the last step above (`powershell.exe -executionpolicy bypass -file ./install-dotfiles-and-software.wsl.ps1`) fails, these steps are the manual equivalent

1. Clone git repo inside distro

   - Clone must happen on linux file system not Windows unless [mount options](https://docs.microsoft.com/en-us/windows/wsl/wsl-config#mount-options)
     have been enabled in `/etc/wsl.conf`. Example settings below, but I recommend still using the linux side.

     ```conf
     [automount]
     options = "metadata,umask=22,fmask=11"
     ```

   - Setup the [git credential manager](https://github.com/microsoft/Git-Credential-Manager-for-Windows/releases) before cloning if this
     isn't already set up (It probably already is setup)

     ```bash
     git clone -c credential.helper="/c/Program\\ Files/Git/mingw64/libexec/git-core/git-credential-manager.exe" https://github.com/RyanClementsHax/dotfiles.git

     # Once the script is run, this will come from global ~/.gitconfig
     # so we are unsetting it here. This is optional to do.
     cd dotfiles && git config --unset credential.helper
     ```

1. Install dotfiles

   - This can be re-run many times safely to link new files added to repo
   - If the dotfiles already exist, the script will rename them with `.<Date-Time>.bak` appended to the end

   ```bash
   chmod +x ./install-dotfiles.wsl.bash
   ./install-dotfiles.wsl.bash

   # Alternatively, instead of using chmod, you could do:
   bash ./install-dotfiles.wsl.bash
   ```

1. Install desired software
   - This will prompt you for your password up to two times and switch default shell to zsh
   - This is not safe to re-run. Manually re-run pieces for updates, but not the whole thing.

   ```bash
   bash ./install-software.bash
   ```

## Migrating ssh keys

Copy ssh keys to/from `C:\.ssh` drive, or wherever your ssh keys live on your windows file system. First you must mount the drive either permanantly or temporarilly.
Before mounting, we must create a location to mount to with `sudo mkdir /mnt/c`

```bash
# Save keys to C drive
cp $HOME/.ssh/* /mnt/c/.ssh
# If copy fails because the file is not writable, run these
sudo chmod 600 /mnt/c/.ssh/*
sudo chmod 644 /mnt/c/.ssh/*.pub
sudo chmod 644 /mnt/c/.ssh/known_hosts

# Load keys from C drive
cp /mnt/c/.ssh/* $HOME/.ssh
sudo chmod 600 ~/.ssh/*
# These two are optional
sudo chmod 644 ~/.ssh/*.pub
sudo chmod 644 ~/.ssh/known_hosts
```

## Testing script with fresh WSL Distro

1. Run `powershell.exe -executionpolicy bypass -file ./create-throwaway-distro.ps1`
1. Verify everything looks good.
1. Delete throw away distro: `wsl.exe --unregister ubuntu-throwaway-2004`
