#!/usr/bin/env bash

# Add this script to your wm startup file.

DIR="$HOME/.config/polybar/blocks"

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch the bar
polybar -q main -c "$DIR"/config.ini &

# if [ $(xrandr --query | grep 'HDMI-1' | cut -d ' ' -f 2) == "connected" ];then
#     polybar -q external -c "$DIR"/config.ini &
# fi
