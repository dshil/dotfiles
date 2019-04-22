#!/bin/bash

set -xe

brew install \
    git svn \
    automake make cmake \
    scons gengetopt sox libuv \
    go ack ag fzf htop vim syncthing \
    neomutt isync msmtp ripmime w3m abook \

brew cask install \
  iterm2 java keepassxc \
  font-anonymous-pro \
  font-dejavu-sans-mono-for-powerline \
  font-droid-sans-mono-for-powerline \
  font-meslo-lg font-input \
  font-liberation-mono-for-powerline \
  font-liberation-sans \
  font-meslo-lg \
  font-nixie-one \
  font-office-code-pro \
  font-pt-mono \
  font-raleway font-roboto \
  font-source-code-pro font-source-code-pro-for-powerline \
  font-source-sans-pro \
  font-ubuntu \
  font-bitstreamverasansmono-nerd-font-mono
