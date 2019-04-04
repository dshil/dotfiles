[ -f ~/.aliases ] && source ~/.aliases

export GOPATH=$HOME/dev/go
export GOROOT=/usr/local/go
export GOBIN=$GOPATH/bin
export GO111MODULE=off

export QMAKE=/usr/bin/qmake-qt5
export BXSHARE=/usr/local/share/bochs
export KERN_DIR=/usr/src/kernels/`uname -r`

export XDG_CONFIG_HOME=~/.config

export PATH=$PATH:$GOBIN:$GOROOT/bin
export PATH=$PATH:~/bin
export PATH=$PATH:$(python3 -m site --user-base)/bin
export PATH=$PATH:~/.iterm2

eval `ssh-agent -s 2>&1 > /dev/null`

# vim:syntax=sh
