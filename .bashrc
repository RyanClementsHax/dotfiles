export PATH="$(yarn global bin):$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

# git
alias ch='git checkout'
alias undo='git reset HEAD~1 --mixed'
alias egc='git config --global -e'
alias cb='git checkout -b'
alias current_branch='git rev-parse --abbrev-ref HEAD'
alias mr='git push -u origin $(current_branch)'
alias m='git checkout master'
alias p='git pull'
alias a='git add -p .'
alias c='git commit'
alias s='git status'
alias d='git diff'

# docker
alias azurite='docker run --name azurite -d -p 10000:10000 -p 10001:10001 -v $HOME/.azurite:/data mcr.microsoft.com/azure-storage/azurite:latest'
alias dc='docker-compose'
alias dpsa="docker ps -a"
alias dps="docker ps"
alias dcu='dc up'
alias dcd='dc down'
alias dcb='dc build'
alias dnuke='docker rm $(docker ps -a -q) && docker rmi $(docker images -a -q)'

# misc
alias rl='source ~/.bashrc'
alias rmbak='find ~ -maxdepth 1 -name "**.bak" -exec rm -r {} +'
alias dev='cd /c/dev'
alias vsc='code .'
alias ec='code /c/dev/dotfiles/'
alias fs='explorer .'
alias vs='explorer.exe *.sln'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
