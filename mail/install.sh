#!/bin/bash

set -xe

# Prepare toolchain:
#  * mbsync:
#      info: sync multiple IMAP accounts
#      usage: mbsync -V all
#  * msmtp:
#      info: send email
#  * w3m:
#      info: read HTML in mutt with a good mood
#  * urlsacn:
#      info: extract and browse the URLs from the email
#
# Make your life save and secure with gnupg.
#
# Password encryption:
#  * Save a password as a plain text: echo "your dummy password" > mypassword
#  * Encrypt it: gpg2 -c mypassword.gpg
#  * Verify it: gpg2 -q --for-your-eyes-only --no-tty -d mypassword.gpg
#  * Remove the initial file: rm mypassword

# Prepare pathes.
mkdir -p \
    $HOME/bin \
    $HOME/Mail \
    $HOME/Mail/sdadev \
    $HOME/Mail/shilinda \
    $HOME/Mail/dshil \
    $HOME/Mail/shilin

sudo chmod +x $(pwd)/mail/msmtpctl.py
ln -sf $(pwd)/mail/msmtpctl.py $HOME/bin/msmtpctl

# Setup notmuch
#
# mutt-notmuch is a helper Perl script for working with notmuch from mutt.
# It is shipped via a lot of options but I usually use only two of them:
#   * Search mails matched the pattern.
#   * Reconstruct the whole thread for the current message.
#
# It is not required to put the script under /usr/bin folder. Feel free to
# put anywhere you want, just ensure that mutt contains the valid path.
#
# Notmuch setup for mutt is shipped as a separate module. If you want to use it
# inside your mutt, simply add `source $HOME/.mail/notmuch.muttrc` into your
# main muttrc configuration file.
#
# For more info see the references:
#   * Source code of the script: https://upsilon.cc/~zack/blog/posts/2011/01/how_to_use_Notmuch_with_Mutt/mutt-notmuch
#   * Man page via key-bending for mutt: https://upsilon.cc/~zack/blog/posts/2011/01/how_to_use_Notmuch_with_Mutt/mutt-notmuch.1.html
#
sudo chmod +x $(pwd)/mail/mutt-notmuch
ln -sf $(pwd)/mail/mutt-notmuch $HOME/bin/mutt-notmuch
ln -sf $HOME/cloud/Sync/mutt/notmuch-config $HOME/.notmuch-config

# Setup abook, command line utility to store contacts.
#
# Abook setup for mutt is shipped as a separate module. If you want to use it
# inside your mutt, simply add `source $HOME/.mail/contact.muttrc` into your
# main muttrc configuration file.
#
# For a while abook will be living together with the aliases provided by the
# mutt itself. To enable abook during the mail lookup use: <C-t>. To be able
# to sync both databases, use the following script:
#
# abook --convert --informat mutt --infile ~/cloud/Sync/mutt/alias \
#       --outformat abook --outfile ~/cloud/Sync/abook/addressbook
#
# For more info see:
#   * man abook
#   * man abookrc
ln -sf $(pwd)/mail/abookrc $HOME/.abook/abookrc
ln -sf $HOME/cloud/Sync/abook/addressbook $HOME/.abook/addressbook

# Ensure that gpg passwords will be stashed.
mkdir -p ~/.gnupg
ln -sf $(pwd)/mail/gpg-agent.conf $HOME/.gnupg/gpg-agent.conf
