# . /etc/X11/xinit/xinitrc-common
# [[ -f ~/.config/X11/xsession ]] && . ~/.config/X11/xsession

# Debian; might be uppercase on Fedora
userresources=$HOME/.config/X11/Xresources
sysresources=/etc/X11/Xresources

if [ -f "$sysresources" ]; then
    xrdb -merge "$sysresources"
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

#export DESKTOP_SESSION=plasma
#exec startplasma-x11
exec i3
