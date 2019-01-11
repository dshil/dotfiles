# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Setup specific aliases and functions
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
source ~/.aliases

# Setup pathes
export GOPATH=$HOME/dev/go
export GOROOT=/usr/local/go
export GOBIN=$GOPATH/bin
export GO111MODULE=on
export PATH=$PATH:$GOBIN:$GOROOT:$GOROOT/bin
export PATH=$PATH:~/bin
export PATH=$PATH:$(python3 -m site --user-base)/bin

# Start services
eval `ssh-agent -s 2>&1 > /dev/null`

# vim:syntax=sh
