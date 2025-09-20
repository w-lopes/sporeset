# Spotify Reset

Tired of Spotify ads? This script automatically detects when advertisements are playing and restarts Spotify to skip them.

## What does it do?

It monitors Spotify window titles and when it detects "Advertisement" _(so please, avoid music with this title lol)_, it automatically:
- Kills the Spotify process
- Restarts Spotify
- Minimizes the window
- Resumes playback

## Requirements

- Debian Mate with X11 _(it should work on others distros/desktop environments too, but I only tested on that)_
- xdotool
- Spotify desktop app (duh)

## Installation

```bash
sudo apt install xdotool
git clone <this repo url>
cd spotify-reset
chmod +x sporeset.sh
```

## Usage

```bash
./sporeset.sh &
```

The script runs continuously in the background, monitoring for advertisements.

## Better usage?

Put it on your `Startup Applications` :)
