# README.md

These are scripts and config files related to my i3 environment.
It is essentially the mirror of my Sway config (or vice versa).
Though largely unmaintained, it should work other than device-specific settings.

## Installation

Install packages:

```sh
sudo dnf install copyq feh flameshot i3 picom polybar setxkbmap redshift rofi xinput xss-lock
```

Move the config files to places in `$XDG_CONFIG_HOME/`.

Create `$XDG_CONFIG_HOME/wallpaper.png` and `$XDG_CONFIG_HOME/lockscreen.png` (reference README for Sway).

Following command will create `~/.fehbg`, which is essentially a shell script where you can control the wallpaper.

```sh
feh --bg-fill $XDG_CONFIG_HOME/wallpaper.png
```

Move content of `./scripts/` to `~/.local/bin/`.

- `calendar.sh`: Send `cal` output to dunst
- `display-tools-toggle.sh`: toggle Picom and Redshift
- `polybar-launch.sh`: wrapper around launching Polybar
- `volume-ctrl.sh`: Assign `./volume-ctrl.sh up/down` to volume up key, it will show a nice progress bar when changing volume
- `weather.sh`: curl `wttr.in`
- `xrandr.sh`: Rofi script to control Xrandr output, orientation, etc.

Deprecated:

- `fzf-powermenu.sh`: Like Rofi powermenu, but uses fzf
- `spotify.py`: https://github.com/Jvanrhijn/polybar-spotify
- `sway-launcher-desktop`: https://github.com/Biont/sway-launcher-desktop

