[ -f ~/.aliases ] && source ~/.aliases

export KERN_DIR=/usr/src/kernels/`uname -r`

export GOPATH=$HOME/dev/go
export GOROOT=/usr/local/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN:$GOROOT/bin
export PATH=$PATH:~/bin
export PATH=$PATH:$(python3 -m site --user-base)/bin

export LC_ALL="en_US.UTF-8"

export IDF_PATH=$HOME/esp/esp-idf
export PATH=$PATH:$IDF_PATH/tools
export PATH=$PATH:$HOME/.espressif/tools/xtensa-esp32-elf/esp-2020r2-8.2.0/xtensa-esp32-elf/bin

eval `ssh-agent -s 2>&1 > /dev/null`

# vim:syntax=sh
