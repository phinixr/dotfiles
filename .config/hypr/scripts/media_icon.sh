#!/bin/bash

# Detect the active media player using metadata instead of status
PLAYER=$(playerctl metadata --format '{{playerName}}' 2>/dev/null)


# Assign a colored icon using Pango Markup
case "$PLAYER" in
    spotify) ICON="<span foreground='#1DB954' size='15000'><big>󰓇 </big></span>" ;;   # Green Spotify Icon
    vlc) ICON="<span foreground='#FFA500'><big>󰕼</big></span>" ;;       # VLC Player (Orange)
    mpv) ICON="<span foreground='#6200EA'><big>󰎆</big></span>" ;;       # MPV (Purple)
    firefox) ICON="<span foreground='#FF9500'><big>󰈹</big></span>" ;;   # Firefox (Might work if playing media)
    chromium*) ICON="<span foreground='#FF0000' size='15000'>󰗃</span>" ;;  # Adjusted size

    *) ICON="" ;;  # No media playing
esac

# Output the selected icon
echo "$ICON"
