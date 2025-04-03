# Haunted Tiles

| <img src="./assets/haunted-tiles-logo.png" width="250" alt="Haunted Tiles logo"> |
| :--: |
| ![i3-sc](./assets/i3-sc.png) |

Collection of utilities and scripts for my Fedora i3-spin setup.

I had an ambitous plan of making this repository the next best tiling window manager "distro" for i3 and Sway, but yeah, now it is just my minimal, Dracula-themed config for my ThinkPad which I use as a focused development machine.

You can get the glimps of my Sway config and other quirky and unnecessary scripts I used to have in the `deprecated` directory.
I still have some ridiculous features like a weather widget using [wttr.in](https://github.com/chubin/wttr.in).

The artwork for [the logo](./assets/haunted-tiles-logo.png), [solar system wallpaper](./assets/naomi-solarsys-draculafied.png), and [the lock screen](./assets/naomi-solarsys-draculafied-lockscreen.png) are done by my girlfriend Naomi.
If you are using one of the images, please credit her by crediting this repository

## Installation

- Fedora i3 spin comes with: `brightnessctl, dunst, feh, i3lock, nm-applet, pavucontrol, setxkbmap, xss-lock`.
- Install: `sudo dnf install arandr blueman copyq flameshot lxpolkit picom polybar redshift rofi xinput`

Personally, I would also install git, kitty, nnn, and vim.

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

Create `~/.Xresources` for the DPI and other X11 related control. E.g.:

```
> cat .Xresources 
Xft.dpi: 120
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

For other tips on using i3/Sway tiling WM, read my [i3-sway-tips repository](https://github.com/theopn/i3-sway-tips) for more information.

## Usage

List of keybindings differing from the default i3:

- `jkl;` -> `hjkl`
- `$mod + h` -> `$mod + z`: toggles hori[z]ontal split
- `$mod + Space`: switches focus between floating windows and tiling windows -> launches Rofi (you can also use the default `$mod+d`)
- `$mod + Shift + c/r/e`:  toggles the `i3_mode`, from which you can choose to reload the config, restart, or exit i3/Sway
- `$mod + Shift + m`: toggles the `monitor_mode`, where you can choose shortcuts for Xrandr commands (`--right-as`, `--left-as`, `--same-as`, and `--off`)
- `$mod + Shift + p`: launches a Rofi menu with power options (lock, suspend, shutdown, etc.)
- `$mod + Shift + s`: launches the screenshot tool
- `$mod + Shift + v`: launches the clipboard manager

