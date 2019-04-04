#!/bin/bash

set -xe

brew install \
    git svn \
    automake make cmake \
    scons gengetopt sox libuv \
    go ack ag fzf htop vim syncthing \
    neomutt isync msmtp ripmime w3m abook \

brew cask install iterm2 java keepassxc
