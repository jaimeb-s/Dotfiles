# Alacritty

Copiar la configuracion de alacritty y para obtener transparencia, instalar [picom](https://archlinux.org/packages/?name=picom) y agregarlo a el **~/.xprofile**.

```bash
sudo pacman -S picom
# ~/.xprofile
picom &

git clone https://github.com/jaimeb-s/Dotfiles.git
cp -r Dotfiles/.config/alacritty ~/.config
cp -r Dotfiles/.config/picom ~/.config
```
