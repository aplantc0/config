#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Set variables for machine-independent configurations
# https://www.reddit.com/r/Polybar/comments/f5o5z9/docked_laptop_how_to_put_polybar_on_every_monitor/

## Network
export WLAN="$(ip addr | grep ": wlp" | cut -d: -f2 | tr -d ' ')"
export ETH="$(ip addr | grep ": enp" | cut -d: -f2 | tr -d ' ')"
#wlan="$(cat /sys/class/net/*/uevent | grep INTERFACE=w | sed 's:.*=::')"
#eth= "$(cat /sys/class/net/*/uevent | grep INTERFACE=e | sed 's:.*=::')"

## Power
#[ $(grep "X401" /sys/class/power_supply/BAT0/model_name) ] && export BAT_FULL=96 || export BAT_FULL=100 
#export BAT_FULL="$([ $(grep "X401" /sys/class/power_supply/BAT0/model_name) ] && echo 96 || echo 100)"

export BAT_ID="$(grep "BAT" /sys/class/power_supply)" # find battery id
if [ "grep "X401" /sys/class/power_supply/$(BAT_ID)/model_name" ]; then
    export BAT_FULL=96;
elif [ "grep "01AV448" /sys/class/power_supply/$(BAT_ID)/model_name" ]; then
    export BAT_FULL=100;
else export BAT_FULL=100;
fi

# Launch
#WLAN="$wlp" ETH="$enp" BAT="$battery" polybar --reload mybar & notify-send "Polybar launched..."
polybar --reload mybar & notify-send "Polybar (re)launched..."
