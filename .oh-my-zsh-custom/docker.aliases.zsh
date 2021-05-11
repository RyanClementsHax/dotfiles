alias azurite='docker run --name azurite -d -p 10000:10000 -p 10001:10001 -v $HOME/.azurite:/data mcr.microsoft.com/azure-storage/azurite:latest'
alias dc='docker-compose'
alias dpsa="docker ps -a"
alias dps="docker ps"
alias dcu='dc up'
alias dcd='dc down'
alias dcb='dc build'
alias dnuke='docker rm $(docker ps -a -q) && docker rmi $(docker images -a -q)'
