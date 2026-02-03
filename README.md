# Haunted Tiles

| <img src="./assets/haunted-tiles-logo.png" width="250" alt="Haunted Tiles logo"> |
| :--:                                                                             |
| ![sway-sc](./assets/sway-sc.png)                                                 |
| SwayFX                                                                           |

Configuration & scripts for my [Dracula](https://draculatheme.com/)-themed (hence the name of the repository) Sway and i3 environment.

I am past my tiling WM "ricing" phase and mainly use KDE + [Krohnkite](https://codeberg.org/anametologin/Krohnkite).
But I still keep a simple Sway configuration for focused work sessions and occasional fun tinkering with it.

Credits:

- [Logo](./assets/haunted-tiles-logo.png): my girlfriend Naomi
- Wallpaper: [Color shifted version](https://www.reddit.com/r/wallpaper/comments/odrqc9/night_city_art_5120x2880/) of ["The Neon Shallows" by kawitt](https://www.reddit.com/r/wallpapers/comments/ib6diq/the_neon_shallows/)
- Lock icon: [Pixabay](https://pixabay.com/vectors/lock-locked-metal-protection-tool-24269/)
- Font: [ProggyClean Nerd Font](https://github.com/bluescan/proggyfonts)

## Sway Installation

1. I typically install Fedora KDE and install Sway on top of it
    ```sh
    sudo dnf install rofi waybar dunst
    # If you install regular Sway instead of Swayfx,
    # make sure to comment out `include ~/.config/sway/swayfx.conf` in the sway config
    sudo dnf copr enable swayfx/swayfx
    sudo dnf install --allowerasing swayfx

    # Necessary packages for system control
    sudo dnf install brightnessctl copyq grimshot pavucontrol playerctl wf-recorder
    # If you don't have Polkit installed, install one
    sudo dnf install lxpolkit

    # Great tools to have for any tiling WM environment
    sudo dnf install blueman network-manager-applet

    # For generating lockscreen image
    sudo dnf install ImageMagick

    # Or your preferred terminal emulator; change $mod+ret in Sway config
    sudo dnf install kitty
    ```
    - If you installed Fedora Sway spin or did `dnf groupinstall`, reference [this](https://gitlab.com/fedora/sigs/sway/sway-config-fedora/-/blob/fedora/sway-config-fedora.spec.rpkg?ref_type=heads) for the complete list of pre-installed packages
2. Install ProggyClean Nerd Font:
    ```sh
    mkdir -p ~/.local/share/fonts && cd ~/.local/share/fonts
    # TODO: Check that this link is up-to-date before you proceed
    wget -O tmp.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/ProggyClean.zip
    unzip tmp.zip && rm tmp.zip
    fc-cache -vf
    cd -
    ```
3. Clone the repository and run the installation script (creates symlink for configuration files and scripts):
    ```sh
    git clone https://github.com/theopn/haunted-tiles.git ~/.config/haunted-tiles
    ~/.config/haunted-tiles/install.sh
    ```
4. Locate your choice of wallpaper (PNG) as `$XDG_CONFIG_HOME/wallpaper.png`
5. Generate a new lock screen image using the included lock icon:
    ```sh
    # use `lock-24269-640.png` a higher resolution image
    magick $XDG_CONFIG_HOME/wallpaper.png $XDG_CONFIG_HOME/haunted-tiles/assets/lock-24269-360.png -gravity center -composite $XDG_CONFIG_HOME/lockscreen.png
    ```
6. Add yourself to the `input` user group for Waybar keyboard state module:
    ```sh
    sudo usermod -a -G input $(whoami)
    ```

For more tips on configuring i3/Sway, read my [i3-sway-tips repository](https://github.com/theopn/i3-sway-tips).

## i3

Read [this](./x11/readme.md)

## Usage

List of keybindings different from the default i3/Sway:

- `jkl;` -> `hjkl`
- `$mod + h` -> `$mod + z`: toggles hori[z]ontal split
- `$mod + d`: ~app launcher~ -> launches Rofi window switcher
- `$mod + Space`: ~toggles between floating/tiled windows~ -> launches Rofi drun
- `$mod + b`: toggles between floating/tiled windows
- `$mod + [/]`: moves the current workspace to the monitor to the left/right
- `$mod + Shift + c/e`:  toggles the `sway_mode`, from which you can choose to reload the config, restart, or exit Sway
- `$mod + Shift + m`: toggles `monitor_mode`, which you can control outputs
- `$mod + Shift + v`: launches `copoyq show`
- `Print`: launches a Rofi menu with screenshot options using Grimshot (area, screen, window, color picker, etc.)
- `Shift+Print`: launches a Rofi script with screen recording menu using `wf-recorder`
- `$mod + Shift + p`: launches a Rofi script with power options (lock, suspend, shutdown, etc.)

Notes:

1. `Window logo [3]` indicator in Waybar means that there are 3 windows in the scratchpad.
2. You can add a window to a scratchpad with `$mod + Shift + -` and cycle through the scratchpad with `$mod + -`.
3. The keybindings for i3 is nearly identical, but please read the config

