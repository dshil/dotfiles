setxkbmap -option
setxkbmap -option 'grp:switch,grp:caps_toggle,grp_led:caps'
setxkbmap -model 'pc105' -layout us,ru
xrdb -merge ~/.Xresources
exec i3
