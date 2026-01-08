# README.md

These are scripts and config files to my i3 environment.
It is essentially a mirror of my Sway config (or vice versa).
I stopped adding new features to it, but it should work without a problem (other than device specific settings to my Framework 13).

## Installation

Install packages:

```sh
sudo dnf install copyq feh flameshot i3 picom polybar setxkbmap redshift rofi xinput xss-lock
```

Move the config files to `$XDG_CONFIG_HOME/`.

Create `$XDG_CONFIG_HOME/wallpaper.png` and `$XDG_CONFIG_HOME/lockscreen.png` (reference the Sway config installation guide).

Create `~/.fehbg`, which is essentially a shell script where you can control the wallpaper.

```sh
feh --bg-fill $XDG_CONFIG_HOME/wallpaper.png
```

Move scripts in `./scripts/` to `~/.local/bin/`.

- `calendar-dunst.sh`: Send `cal` output to dunst
- `redshift-toggle.sh`: toggle Redshift
- `polybar-launch.sh`: wrapper around launching Polybar
- `volume-ctrl.sh`: nice progress bar when changing volumes
- `weather-dunst.sh`: Send `curl wttr.in` to dunst
- `xrandr-ctrl.sh`: control Xrandr output, orientation, etc.

Deprecated:

- `fzf-powermenu.sh`: Like Rofi powermenu, but uses fzf. Not sure why I thought it was a good idea
- `spotify.py`: https://github.com/Jvanrhijn/polybar-spotify
- `sway-launcher-desktop`: https://github.com/Biont/sway-launcher-desktop

