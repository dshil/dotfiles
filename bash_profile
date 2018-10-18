# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs
PATH=$PATH:$HOME/.local/bin:$HOME/bin
export PATH

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
    setxkbmap -option
    setxkbmap -option 'grp:switch,grp:caps_toggle,grp_led:caps'
    setxkbmap -model 'pc105' -layout us,ru

    xrdb -merge ~/.Xresources

    exec startx
fi
