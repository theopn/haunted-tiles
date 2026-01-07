# README.md

These are scripts and config related to i3 environment.
Move the content to places in `$XDG_CONFIG_HOME/`, and they should be usable.

- `calendar.sh`: Send `cal` output to dunst
- `fzf-powermenu.sh`: Like Rofi powermenu, but uses fzf
- `spotify.py`: https://github.com/Jvanrhijn/polybar-spotify
- `super-cat-menu.sh`: top left menu in Waybar but in fzf
- `sway-launcher-desktop`: https://github.com/Biont/sway-launcher-desktop (don't let the name deceive you, it is a bash script perfectly usable in X11 environment)
- `volume-ctrl.sh`: Assign `./volume-ctrl.sh up/down` to volume up key, it will show a nice progress bar when changing volume
- `xrandr.sh`: Rofi script to control Xrandr output, orientation, etc.
- `polybar-launch.sh`: wrapper around launching Polybar
- `display-tools-toggle.sh`: toggle Picom and Redshift
- `weather.sh`: curl `wttr.in`

- `dunst/`: fully functioning Dracula themed Dunst config

My i3 configuration is essentially the mirror of Sway config (or vice versa).

Soft-dependencies:

```sh
sudo dnf install copyq feh flameshot picom polybar setxkbmap redshift rofi xinput xss-lock
```


To install, use the following:

```sh
XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="~/.config"}
HAUNTED_TILES_DIR=${XDG_CONFIG_HOME}/haunted-tiles

echo "Deploying i3, Polybar, and Picom..."
ln -s ${HAUNTED_TILES_DIR}/i3 ${XDG_CONFIG_HOME}/i3
feh --bg-fill $XDG_CONFIG_HOME/wallpaper.png
ln -s ${HAUNTED_TILES_DIR}/polybar ${XDG_CONFIG_HOME}/polybar
ln -s ${HAUNTED_TILES_DIR}/picom ${XDG_CONFIG_HOME}/picom

cat <<EOF >> ${XDG_CONFIG_HOME}/redshift.conf
[redshift]
temp-day=5600
temp-night=3500
gamma=0.8
adjustment-method=randr
location-provider=manual

[manual]
lat=0.0
lon=0.0
EOF
```

