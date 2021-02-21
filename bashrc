[ -f ~/.aliases ] && source ~/.aliases

export KERN_DIR=/usr/src/kernels/`uname -r`

export GOPATH=$HOME/dev/go
export GOROOT=/usr/local/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN:$GOROOT/bin
export PATH=$PATH:~/bin
export PATH=$PATH:$(python3 -m site --user-base)/bin

export LC_ALL="en_US.UTF-8"

eval `ssh-agent -s 2>&1 > /dev/null`

# vim:syntax=sh
