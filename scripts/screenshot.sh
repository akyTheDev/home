#!/bin/bash
#
# Wofi Screenshot Menu (Emoji Version for Debugging)
#

DIR=~/Pictures/Screenshots
mkdir -p "$DIR"
FILENAME="$DIR/$(date +'%Y-%m-%d_%H-%M-%S').png"

# --- Options with Standard Emoji Icons ---
OPTIONS="💾 Save Fullscreen\n💾 Save Area\n📋 Copy Fullscreen\n📋 Copy Area"

choice=$(echo -e "$OPTIONS" | wofi --dmenu --prompt "Screenshot:")

if [ -z "$choice" ]; then
    exit 0
fi

case "$choice" in
    "💾 Save Fullscreen")
        grim "$FILENAME" && notify-send "Screenshot Saved" "$FILENAME"
        ;;
    "💾 Save Area")
        slurp | grim -g - "$FILENAME" && notify-send "Screenshot Saved" "Area saved to $FILENAME"
        ;;
    "📋 Copy Fullscreen")
        grim - | wl-copy --type image/png && notify-send "Screenshot Copied" "Full screen copied."
        ;;
    "📋 Copy Area")
        slurp | grim -g - - | wl-copy --type image/png && notify-send "Screenshot Copied" "Area copied."
        ;;
esac
