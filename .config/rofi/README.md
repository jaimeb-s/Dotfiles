# Rofi

Instalar lo siguiente para configurar.

```bash
sudo pacman -S rofi 
paru -S nerd-fonts-mononoki tela-circle-icon-theme-git

git clone https://github.com/davatorium/rofi-themes.git
sudo cp rofi-themes/User\ Themes/onedark.rasi /usr/share/rofi/themes
```

Eliminar la siguente linea en **/usr/share/rofi/themes/onedark.rasi**.

```bash
font: "Knack Nerd Font 14";
```

Copiar mis configuraciones.

```bash
git clone https://github.com/jaimeb-s/Dotfiles.git
cp -r Dotfiles/.config/rofi ~/.config
```
