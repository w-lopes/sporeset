#!/bin/bash

reset_spotify() {
    echo "Advertisement detected! Resetting Spotify..."
    pkill spotify
    sleep 1
    spotify &
    sleep 1

    xdotool search --class spotify windowminimize %@ 

    dbus-send --session \
      --dest=org.mpris.MediaPlayer2.spotify \
      --type=method_call \
      --print-reply \
      /org/mpris/MediaPlayer2 \
      org.mpris.MediaPlayer2.Player.PlayPause
}

while true; do
    spotify_windows=$(xdotool search --class "spotify" 2>/dev/null)

    if [ -n "$spotify_windows" ]; then
        for window_id in $spotify_windows; do
            window_title=$(xdotool getwindowname "$window_id" 2>/dev/null)

            if [[ -n "$window_title" ]] && [[ "$window_title" != "spotify" ]]; then
                echo "Checking window: '$window_title'"

                if [[ "$window_title" == *"Advertisement"* ]]; then
                    reset_spotify
                    sleep 10
                    break
                fi
            fi
        done
    else
        echo "No Spotify windows found"
    fi

    sleep 2
done
  