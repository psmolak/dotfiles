#!/bin/bash

xrdb -load ~/.Xresources
hsetroot -solid '#151515' &
compton --config ~/.config/compton/compton.conf &
sxhkd ~/.config/sxhkd/bspwm &
twmnd &
bin/mapo &
unclutter &
tylda --daemon &
looper 10 selsave 1>/dev/null 2>&1 &

exec bspwm
