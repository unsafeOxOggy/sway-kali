#!/bin/sh
geometry=$(slurp) || exit 1
grim -g "$geometry" - | wl-copy && notify-send "Screenshot" "Area copied to clipboard"
