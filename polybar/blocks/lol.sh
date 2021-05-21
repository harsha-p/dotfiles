#!/usr/bin/env bash

if [ $(xrandr --query | grep 'HDMI-1' | cut -d ' ' -f 2) == "connected" ];then
    echo "lol"
fi

