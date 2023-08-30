# Haunted Tiles

| <img src="./assets/haunted-tiles-logo.png" width="250" alt="Haunted Tiles logo"> |
| :--: |
| ![sway-sc](./assets/sway-sc.png) |
| Sway |
| ![i3-sc](./assets/i3-sc.png) |
| i3 |


Haunted Tiles is my personal i3 WM and Sway setup, along with essential tiling WM tools like notification daemon, app launcher, and Bash/Python scripts to bring some of the DE experience to minimal tiling WMs.
It used to be a part of my [dotfiles repository](https://github.com/theopn/dotfile), and with the growing size of configurations and shared scripts between i3 and Sway, I made a separate repository for it.

Both sets of configuration strive to be a minimal setup that gets out of your way while providing practical features and being aesthetically pleasing.
The overall theme is [Dracula](https://draculatheme.com/contribute), hence the name "Haunted"-tiles (it's also partially because I like naming everything).

Feel free to check out:

- [Theovim](https://github.com/theopn/theovim/), my Neovim configuration
- Rest of my [dotfiles](https://github.com/theopn/dotfiles)

## i3 Dependencies

These are packages that get directly called in the i3 config or one of the scripts:

- Brightnessctl: Backlight control
- CopyQ: Clipboard manager
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

## Sway Dependencies

- Clipman & wl-clipboard: Wayland clipboard utility (wl-clipboard) and terminal command-line clipboard history manager (clipman)
- fzf: I use fzf as a rofi replacement in some scripts. As Rofi becomes stable in Wayland, this won't be necessary
- Gammastep: Redshift replacement
- Grim & Slurp: Select a region in Wayland compositor (Slurp) and take a screenshot (Grim)
- Waybar: The bar

## Installation

- Installation script will prompt you before creating a symlink for each configuration file
- If there is a file/directory in the destination, it will be moved to `~/haunted-tiles.bak`
- **Make sure you have Nerd Font installed!**
    Haunted-tiles uses [CaskaydiaCove Nerd Font](https://www.nerdfonts.com/font-downloads).

```bash
git clone  ~/.config/haunted-tiles
~/.config/haunted-tiles/install.sh
```

## Keybindings

Most of the default i3/Sway keybindings are kept. Notable keybindings include:

- `$mod` is the super key
- `$mod + Return`: opens terminal
- `$mod + hjkl`: focuses the left, down, up, or right window
- `$mod + Shift + hjkl`: moves the current window to left, down, up, or right
- `$mod + f`: toggles the full-screen mode
- `$mod + s/w/e`: toggles the stacking, tabbed, or split (tiling) layout
- `$mod + Shift space`: toggles floating mode for the current window
- `$mod + 1-9`: moves to workspace 1 - 9
- `$mod + Shift + 1-9`: moves the current window to workspace 1 - 9
- `$mod + r`: enters the resize mode

For the complete list of keybindings, reference the config file.

List of keybindings differing from the default i3/Sway:

- `jkl;` -> `hjkl`
- `$mod + h` -> `$mod + z`: toggle hori[z]ontal split
- `$mod + Space`: launches Rofi (you can also use the default `$mod+d`)
- `$mod + Shift + c/r/e`: launches `i3_mode`/`sway_mode`, from which you can choose to reload the config, restart, or exit i3/Sway
- `$mod + Shift + p`: launches a Rofi menu with power options (lock, suspend, shutdown, etc.)
    ![rofi-powermenu](./assets/rofi-powermenu-demo.png)
- `$mod + Shift + s`: launches the screenshot tool
- `$mod + Shift + v`: launches the clipboard manager

Sway only keybindings:

- `$mod + Shift + Return`: simulates the "Cat Menu" of X11 Polybar (see the Polybar section below) in the form of a floating fzf script
    ![sway-super-cat-menu-demo](./assets/super-cat-menu-demo.png)
- `$mod + Shift + r`: clears clipboard history (replaces one of the `i3_mode` keybindings, since there is no "[r]estart" in Sway)

## Polybar

- Clicking the cat icon in the top left gives you hidden options
    ![polybar-super-cat-menu-demo](./assets/polybar-super-cat-menu-demo.png)
    - Current Spotify music
    - Weather using `wttr.in`
    - Toggle do not disturb
    - Toggle compositor (Picom)
    - Toggle nightlight (redshift)
- You can mute sound by clicking the volume icon
- You can view the current month's calendar by clicking the date
    - You can view the last month's calendar by right-clicking the date

## Credits

- The artwork for [the logo](./assets/haunted-tiles-logo.png), [solar system wallpaper](./assets/naomi-solarsys-draculafied.png), and [lock screen](./assets/naomi-solarsys-draculafied-lockscreen.png) are done by my girlfriend Naomi. If you are using one of the images, please credit her by crediting this repository
- Wallpapers in `./assets/dracula-wallpaper/` are from the [official Dracula wallpaper collection](https://github.com/dracula/dracula-theme)
- [sway-launcher-desktop](https://github.com/Biont/sway-launcher-desktop) is included
- `./scripts/spotify.py` is heavily based on [polybar-spotify](https://github.com/Jvanrhijn/polybar-spotify/)

