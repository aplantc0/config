# set variables here; sources bashrc

echo "$0" | grep "bash$" >/dev/null && [ -f $HOME/.bashrc ] && source "$HOME/.bashrc" # source .bashrc

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
    fi
fi

# environment
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export LESS=-R
export LESSHISTFILE="${XDG_CACHE_HOME:-$HOME/.cache}/less/history"
export HISTFILE="${XDG_CONFIG_HOME:-$HOME/.config}/bash/history"
export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wget/wgetrc"
#export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority" # careful when using a dm
export SSB_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/zoom" # also make it for flatpak
export PASSWORD_STORE_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/pass"
export GTK_RC_FILES="${XDG_CONFIG_HOME:-$HOME/.config}/gtk-1.0/gtkrc"
export GTK2_RC_FILES="${XDG_CONFIG_HOME:-$HOME/.config}/gtk-2.0/gtkrc"
export TRANSMISSION_HOME="${XDG_CONFIG_HOME:-$HOME/.config}/transmission-daemon"
[[ $HOSTNAME = work ]] && export BROWSER="brave-browser" || export BROWSER="firefox"
#export BAT="/sys/class/power_supply/BAT0/capacity"
#[[ $HOSTNAME != work2 ]] && export QT_QPA_PLATFORMTHEME=qt5ct # keepassxc and other qt

[ -d "$HOME/.local/bin" ] && export PATH="$HOME/.local/bin:$PATH" # bin
[ -f "$HOME/Work/bib.bib" ] && export BIB="$HOME/Work/bib.bib" # bib

# User specific environment; same as above
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

#sudo -n loadkeys ${XDG_DATA_HOME:-$HOME/.config}/ttymaps.kmap 2>/dev/null # tty keys; edit /etc/sudoers

[[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]] && startx # automatically exec startx after login
