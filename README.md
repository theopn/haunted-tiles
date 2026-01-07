# Haunted Tiles

| <img src="./assets/haunted-tiles-logo.png" width="250" alt="Haunted Tiles logo"> |
| :--:                                                                             |
| ![sway-sc](./assets/sway-sc.png)                                                 |
| SwayFX with LDR Wallpaper                                                        |

Configuration & scripts for my [Dracula](https://draculatheme.com/)-themed (hence the name of the repository) Sway ~and i3~ environment.

I am past my tiling WM "ricing" phase and mainly use KDE + [Krohnkite](https://codeberg.org/anametologin/Krohnkite).
But I still keep a simple Sway configuration for a focused work session + occasional fun.

Credits:

- [Logo](./assets/haunted-tiles-logo.png): my girlfriend Naomi
- Wallpaper: []()
- Lock icon: [Pixabay](https://pixabay.com/vectors/lock-locked-metal-protection-tool-24269/)

## Installation

1. I typically install Fedora KDE and install Sway on top of it
    ```sh
    sudo dnf install sway rofi-wayland waybar dunst
    # These are necessary for controlling system
    sudo dnf install brightnessctl clipman grimshot playerctl wf-recorder
    # If you do not have Polkit installed (I do from KDE installation), install one
    sudo dnf install lxpolkit

    # These are great tools to have for tiling WM
    sudo dnf install blueman network-manager-applet

    # For generating lockscreen iage
    sudo dnf install ImageMagick

    # I use Kitty
    sudo dnf install kitty
    ```
    - If you installed Sway spin, (check [here](https://gitlab.com/fedora/sigs/sway/sway-config-fedora/-/blob/fedora/sway-config-fedora.spec.rpkg?ref_type=heads) for the complete list of pre-installed packages)
2. Install ProggyClean Nerd Font:
    ```sh
    mkdir -p ~/.local/share/fonts && cd ~/.local/share/fonts
    # TODO: Check that this link is up-to-date before you proceed
    wget -O tmp.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/ProggyClean.zip
    unzip tmp.zip
    fc-cache -vf
    rm tmp.zip
    cd -
    ```
3. Locate the wallpaper as a PNG file at `$XDG_CONFIG_HOME/wallpaper.png`
4. Generate a new lock screen image using the included lock icon:
    ```sh
    # use `lock-24269-640.png` for higher resolution image
    magick $XDG_CONFIG_HOME/wallpaper.png $XDG_CONFIG_HOME/haunted-tiles/assets/lock-24269-360.png -gravity center -composite $XDG_CONFIG_HOME/lockscreen.png
    ```
5. Finally, clone the repository and run the installation script:
    ```sh
    git clone https://github.com/theopn/haunted-tiles.git ~/.config/haunted-tiles
    ~/.config/haunted-tiles/install.sh
    ```
6. Add yourself to the `input` user group for Waybar keyboard state module:
    ```sh
    usermod -a -G input [username]
    ```
7. Modify the coordinates in `$XDG_CONFIG_HOME/gammastep/config.ini` using:
    ```sh
    curl http://ip-api.com/json?fields=lat,lon
    ```

For other tips on configuring i3/Sway tiling WM, read my [i3-sway-tips repository](https://github.com/theopn/i3-sway-tips).

## Usage

List of keybindings different from the default i3/Sway:

- `jkl;` -> `hjkl`
- `$mod + h` -> `$mod + z`: toggles hori[z]ontal split
- `$mod + d`: ~app launcher~ -> launches Rofi window switcher
- `$mod + Space`: ~toggles between floating/tiled windows~ -> launches Rofi drun
- `$mod + b`: toggles between floating/tiled windows
- `$mod + [/]`: moves the current workspace to the monitor to the left/right
- `$mod + Shift + c/e`:  toggles the `sway_mode`, from which you can choose to reload the config, restart, or exit Sway
    - `$mod + shift + r`: (Sway) toggles `screenrecord mode` to control `wf-recorder`
- `$mod + Shift + m`: toggles `monitor_mode`, which you can control outputs
- `$mod + Shift + p`: launches a Rofi menu with power options (lock, suspend, shutdown, etc.)
- `$mod + Shift + s`: toggles `screenshot_mode` which you can choose area, screen, or window capture from Grimshot
- `$mod + Shift + v`: launches the clipboard manager (Copy Qin i3, Clipman in Sway)

`[3]=` indicator in Waybar means that there are 3 windows in the scratchpad.
You can add a window to a scratchpad with `$mod + Shift + -` and cycle through the scratchpad with `$mod + -`.
`[]=` is inspired by the tiling window indicator in the dwm statusbar, which does not make sense in this context, but I thought it looked cute.

