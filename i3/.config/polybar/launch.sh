#!/bin/bash

# Kill already running bars
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar (example for single monitor)
polybar example &

# For multi-monitor setups, you can loop over monitors like:
# for m in $(polybar --list-monitors | cut -d":" -f1); do
#   MONITOR=$m polybar example &
# done
