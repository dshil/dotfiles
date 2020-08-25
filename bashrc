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

export PATH=$PATH:$HOME/dev/enapter/esp32-firmware/tools

export LC_ALL="en_US.UTF-8"

export IDF_PATH=$HOME/dev/esp-idf-upstream
export PATH=$PATH:$IDF_PATH/tools
export PATH=$PATH:$HOME/.espressif/tools/xtensa-esp32-elf/esp-2020r2-8.2.0/xtensa-esp32-elf/bin

eval `ssh-agent -s 2>&1 > /dev/null`

# vim:syntax=sh
