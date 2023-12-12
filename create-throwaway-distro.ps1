$app="C:\Users\ryanclementshax\Downloads\Ubuntu_2004.2020.424.0_x64.appx"
$download="C:\Users\ryanclementshax\Downloads\Ubuntu_2004.2020.424.0_x64"

if (!(Test-Path $app)) {
  Invoke-WebRequest -Uri https://aka.ms/wslubuntu2004 -OutFile $app
}

if (!(Test-Path $download)) {
  & 'C:\Program Files\7-Zip\7z.exe' x $app "-o$download" -y
}

New-Item -Path C:\Users\ryanclementshax\AppData\Local\Packages\Throwaway_WSL_Ubuntu -ItemType Directory -Force
wsl.exe --import ubuntu-throwaway-2004 C:\Users\ryanclementshax\AppData\Local\Packages\Throwaway_WSL_Ubuntu C:\Users\ryanclementshax\Downloads\Ubuntu_2004.2020.424.0_x64\install.tar.gz --version 2
wsl.exe -d ubuntu-throwaway-2004 bash -c "adduser --gecos '' --ingroup sudo ryanclementshax"
Get-ItemProperty Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Lxss\*\ DistributionName | Where-Object -Property DistributionName -eq ubuntu-throwaway-2004 | Set-ItemProperty -Name DefaultUid -Value ((wsl -d ubuntu-throwaway-2004 -u ryanclementshax -e id -u) | Out-String)
wsl.exe -d ubuntu-throwaway-2004 bash -c "cd ~/dev && \
git clone https://github.com/RyanClementsHax/dotfiles.git && \
cd dotfiles \
bash install-dotfiles.wsl.bash && \
bash install-software.wsl.bash"
