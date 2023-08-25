# Haunted-Tiles

| <img src="./assets/haunted-tiles-logo.png" width="250" alt="Haunted Tiles logo"> |
|:--:|
| Cute Logo |
| ![i3-sc](./assets/i3-sc.png) |
| i3 |
| ![sway-sc]() |
| Sway |


Haunted-tiles is my i3 WM and Sway configurations, along with accommodating tools.
It used to be a part of my [dotfiles repository](https://github.com/theopn/dotfile), but with the growing number of configurations and shared scripts between i3 and Sway, I made a separate repository for it.

Both WM has 

## Installation

```bash
git clone  ~/.config/haunted-tiles
~/.config/haunted-tiles/install.sh
```

## Keybindings

List of keybindings differing from the default:

- `jkl;` -> `hjkl`
- `$mod + h` -> `$mod + z`: "hori[z]ontal" split
- `$mod + Space`: launches Rofi (you can also use the default `$mod+d`)
- `$mod + Shift + c/r/e`: launches `i3_mode`/`sway_mode`, from which you can choose to reload config, restart, or exit i3/Sway
- `$mod + Shift + p`: launches a Rofi menu with power options (lock, suspend, shutdown, etc.)
- `$mod + Shift + s`: screenshot tool

## i3 Dependencies

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

- Clicking the cat icon in the top left gives you hidden options
    ![polybar-super-cat-menu-demo](./assets/polybar-super-cat-menu-demo.png)
    - Current Spotify music
    - Weather using `wttr.in`
    - Toggle do not disturb
    - Toggle compositor (Picom)
    - Toggle nightlight (redshift)
- You can mute sound by clicking the volume icon
- You can view current month calendar by clicking the date
    - You can view the last month calendar by right-clicking the date
