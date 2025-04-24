# Haunted Tiles

| <img src="./assets/haunted-tiles-logo.png" width="250" alt="Haunted Tiles logo"> |
| :--:                                                                             |
| ![sway-sc](./assets/sway-sc.png)                                                 |
| ![i3-sc](./assets/i3-sc.png)                                                     |

Collection of utilities and scripts for my Fedora Sway and i3 spin setup.

I had an ambitious plan of making this repository the next best tiling window manager "distro", but now it is just my minimal, Dracula-themed tiling WM config for my ThinkPad X270 which I use as a focused development machine.

The artwork for [the logo](./assets/haunted-tiles-logo.png), [solar system wallpaper](./assets/naomi-solarsys-draculafied.png), and [the lock screen](./assets/naomi-solarsys-draculafied-lockscreen.png) are done by my girlfriend Naomi.
If you are using one of the artworks, please credit her by crediting this repository

## How I Setup Fedora Sway/i3 spin

Install utilities:

- Tools: `fzf git kitty vim`
- GUI polkit: `lxpolkit`
- Korean input: `adobe-source-han-sans-kr-fonts fcitx5 fcitx5-hangul`
- Power profile daemon replacement with Redhat's Tuned project: `tuned-ppd`

Install packages for i3:

- Check the `i3.spec` file of the [i3-config-fedora repository](https://src.fedoraproject.org/rpms/i3/tree/rawhide) for the complete list of packages out of the box
    - Notable packages are: `xss-lock network-manager-applet brightnessctl dunst feh setxkbmap`
- Other tools: `copyq flameshot picom polybar redshift rofi xinput`
- Not necessary but recommended: `arandr blueman`

Install packages for Sway:

- Check the `.rpkg` file of the [sway-config-fedora repository](https://gitlab.com/fedora/sigs/sway/sway-config-fedora) for the complete list of packages out of the box
    - Notable packages are: `rofi-wayland brightnessctl grimshot playerctl waybar`
- Other tools: `clipman gammashift`

Install UbuntuMono Nerd Font:

```sh
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
wget -O tmp.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/UbuntuMono.zip
unzip tmp.zip
fc-cache -vf
rm tmp.zip
cd -
```

Finally, clone the repository and run the installation script:

```sh
git clone https://github.com/theopn/haunted-tiles.git ~/.config/haunted-tiles
~/.config/haunted-tiles/install.sh
```

Create `~/.config/redshift.conf` to control the behavior of the "nightlight" utility:

```
[redshift]
temp-day=5600
temp-night=3500
gamma=0.8
adjustment-method=randr
location-provider=manual

[manual]
lat=<decimal degree of your loc>
lon=<decimal degree of your loc>
```

For Gammastep:

- `[redshift]` -> `[general]`
- `randr` -> `wayland`
- create as `~/.config/gammastep/config.ini`

Create `~/.Xresources` for the DPI and other X11 related control. E.g.:

```
$ cat .Xresources 
Xft.dpi: 120
```

Set fcitx5 as the default input source in `~/.bash_profile` ([fcitx5 Wiki recommends `bash_profile`](https://fcitx-im.org/wiki/Setup_Fcitx_5#GLFW_IM_MODULE)) using environment variables:

```
$ cat ~/.bash_profile

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export SDL_IM_MODULE=fcitx
export GLFW_IM_MODULE=ibus
export XMODIFIERS=@im=fcitx
```

Add Tuned and configure profile

```
systemctl enable tuned
tuned-adm list              # list all available profiles
tuned-adm profile balanced  # select a profile
```

For other tips on using i3/Sway tiling WM, read my [i3-sway-tips repository](https://github.com/theopn/i3-sway-tips) for more information.

## Usage

List of keybindings differing from the default i3/Sway:

- `jkl;` -> `hjkl`
- `$mod + h` -> `$mod + z`: toggles hori[z]ontal split
- `$mod + Space`: switches focus between floating windows and tiling windows -> launches Rofi (you can also use the default `$mod+d`)
- `$mod + [/]`: moves the current workspace to the monitor to the left/right
- `$mod + Shift + c/r/e`:  toggles the `i3_mode`/`sway_mode`, from which you can choose to reload the config, restart, or exit i3/Sway
- `$mod + Shift + m`: launches a Rofi script to control connected outputs
    - (Sway) launches `monitor_mode`, which you can control outputs
- `$mod + Shift + p`: launches a Rofi menu with power options (lock, suspend, shutdown, etc.)
- `$mod + Shift + s`: launches the screenshot tool (Flamshot)
    - (Sway) launches `screenshot_mode` which you can choose area, screen, or window capture from Grimshot
- `$mod + Shift + v`: launches the clipboard manager (Copy Qin i3, Clipman in Sway)
    - `$mod + shift + r`: (Sway) resets Clipman

`[3]=` indicator in Waybar means that there are 3 windows in the scratchpad.
You can add a window to a scratchpad with `$mod + Shift + -` and cycle through the scratchpad with `$mod + -`.
`[]=` is inspired by the tiling window indicator in the dwm statusbar, which does not make sense in this context, but I thought it looked cute.

