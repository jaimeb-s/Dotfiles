# Xmonad

![xmonad](../.screenshot/xmonad.png)

Instalar los siguientes paquetes.

```bash
sudo pacman -S xmonad xmonad-contrib alacritty rofi code scrot brightnessctl xmobar feh xdotool pamixer pacman-contrib playerctl

paru -S google-chrome nerd-fonts-mononoki spotify rofi-power-menu
```

Y despues copiar los archivos.

```bash
git clone https://github.com/jaimeb-s/Dotfiles.git
cp -r Dotfiles/.config/xmobar ~/.config
cp -r Dotfiles/.xmonad ~/
cp -r Dotfiles/.wallpapers ~/

cp Dotfiles/.local/brightness ~/.local/bin
cp Dotfiles/.local/volume ~/.local/bin
cp Dotfiles/.local/battery ~/.local/bin
```

Agregar lo siguiente a **~/.xprofile**

```bash
export PATH=$HOME/.local/bin:$PATH
```

Finalmente recompile xmonad.

```bash
xmonad --recompile
```
