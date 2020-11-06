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
alias azurite='docker run -d -p 10000:10000 -p 10001:10001 -v C:/Users/RTClements/dev/azurite:/data mcr.microsoft.com/azure-storage/azurite:latest'
alias dc='docker-compose'
alias dcu='dc up'
alias dcd='dc down'
alias dcb='dc build'

# misc
alias rl='source ~/.bashrc'
alias rmbak='find ~ -maxdepth 1 -name "**.bak" -exec rm -r {} +'
alias dev='cd /c/dev'
alias vsc='code .'
alias ec='code /c/dev/dotfiles/'
alias fs='explorer .'
vs(){
  explorer.exe *.sln;
  exit 0;
}
