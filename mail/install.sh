#!/bin/bash

set -xe

# Required utilities:
#  * mbsync:
#      info: sync multiple IMAP accounts
#      usage: mbsync -V all
#  * msmtp:
#      info: send email
#  * ripmime:
#      info: save attachments from emails
#  * w3m:
#      info: read HTML in mutt with a good mood
#  * urlsacn:
#      info: extract and browse the URLs from the email
dnf install -y isync msmtp ripmime w3m urlscan

# Make your life save and secure with gnupg.
#
# Password encryption:
#  * Save a password as a plain text: echo "your dummy password" > mypassword
#  * Encrypt it: gpg2 -c mypassword.gpg
#  * Verify it: gpg2 -q --for-your-eyes-only --no-tty -d mypassword.gpg
#  * Remove the initial file: rm mypassword
dnf install -y gnupg

dnf copr enable flatcap/neomutt
dnf install -y dnf-plugins-core neomutt

mkdir -p $HOME/Mail \
    $HOME/Mail/sdadev \
    $HOME/Mail/shilinda \
    $HOME/Mail/dshil
