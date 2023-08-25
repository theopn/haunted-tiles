# Haunted-Tiles

| <img src="./assets/haunted-tiles-logo.png" width="250" alt="Haunted Tiles logo"> |
|:--:|
| Cute Logo |
| ![i3-sc](./assets/i3-sc.png) |
| i3 |
| ![sway-sc]() |
| Sway |


My i3 and Sway configurations, along with accommodating tools.

## Installation

```bash
git clone  ~/.config/haunted-tiles
~/.config/haunted-tiles/install.sh
```

## Keybindings

List of keybindings differing from the default:

- `jkl;` -> `hjkl`
- `$mod + h` -> `$mod + z`: "hori[z]ontal" split
- `$mod + Space`: launches Rofi as well as the default `$mod+d`
- `$mod + Shift + c/r/e`: launches `i3_mode`, from which you can choose config reload, restart, or exit i3
- `$mod + Shift + p`: launches a Rofi menu with power options (lock, suspend, shutdown, etc.)
- `$mod + Shift + s`: Screenshot tool

## i3 Dependencies

List of packages required for my configuration:

- Brightnessctl: Backlight control
- Clipit: Clipboard manager
- Dunst: Notification daemon
- Feh: Wallpaper
- Flameshot: Screenshot on X
- i3lock: Simple lock program
- network-manager-applet: GUI network manager
- Picom: Compositor
- Polybar: This is where all the ricing takes place
- Redshift: Blue light filter/nightlight/nightshift
- Rofi: App and custom power menu launcher
- setxkbmap: Swap caps lock and control, your pinky will thank you
- xinput: Enabling trackpad natural scrolling and tap-to-click
- xss-lock: Calling i3lock before suspending

Not necessary but helpful packages:

- Blueman: GUI Bluetooth manager
- Pavucontrol: Volume control for Pulseaudio (or Pipewire that pretends to be Pulseaudio)
- xrandr: External display output control, should be a dependency for X11 server

## Polybar

- Clicking the cat icon in the top left gives you hidden options.
    - Current Spotify music
    - Weather using `wttr.in`
    - Toggle do not disturb
    - Toggle compositor (Picom)
    - Toggle nightlight (redshift)
- You can mute sound by clicking the volume icon
- You can view current month calendar by clicking the date
    - You canview the last month calendar by right-clicking the date
