#!/bin/sh
# This shell script is PUBLIC DOMAIN. You may do whatever you want with it.

TOGGLE=$HOME/.toggle

if [ ! -e $TOGGLE ]; then
    touch $TOGGLE
    xinput map-to-output 'HUION 256C PEN STYLUS Pen (0)' eDP-1
else
    rm $TOGGLE
    xinput map-to-output 'HUION 256C PEN STYLUS Pen (0)' HDMI-1
fi
