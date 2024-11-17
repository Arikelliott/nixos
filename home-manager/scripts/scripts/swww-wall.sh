#!/usr/bin/env bash

# Gets active display ID
dp=$(sh /home/arik/dotfiles/scripts/hypr-current-monitor.sh)
cursorpos=$(sh /home/arik/dotfiles/scripts/hypr-mm-cursorpos.sh)

swww init &>/dev/null
# echo "$dp"
swww img -o $dp $1  --transition-type grow --transition-pos "$cursorpos" --invert-y --transition-duration 1.5