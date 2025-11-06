#!/bin/bash

VOLUME=$(pamixer --get-volume)
MUTED=$(pamixer --get-mute)

if [ "$MUTED" = "true" ]; then
    notify-send -h string:x-canonical-private-synchronous:volume_notif -t 2000 " Volume Muted"
else
    notify-send -h string:x-canonical-private-synchronous:volume_notif -h int:value:$VOLUME -t 2000 " Volume: ${VOLUME}%"
fi
