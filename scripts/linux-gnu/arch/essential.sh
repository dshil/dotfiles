#!/bin/bash

set -xe

sudo pacman -Sy \
       terminus-font ttf-{bitstream-vera,liberation,dejavu} freetype2 \
       python3 git tk svn make cmake autoconf the_silver_searcher htop \
       okular acpid i3-wm i3lock light ack ctags weechat abook \
       gvfs gvfs-smb sshfs curl fontconfig isync msmtp ripmime w3m \
       urlscan gnupg neomutt notmuch perl perl-string-shellquote \
       perl-mail-box perl-mailtools keepassxc gvim
