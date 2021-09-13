# Fish

Instalar [fish](https://archlinux.org/packages/community/x86_64/fish/) y configurar como predeterminado.

```bash
sudo pacman -S fish
chsh -s /usr/bin/fish
```

Instalar [starship](https://archlinux.org/packages/community/x86_64/starship/) para obtener obrener una mejor vista y copiar mis archivos.

```bash
sudo pacman -S starship exa bat

# Copiar estos archivos
git clone https://github.com/jaimeb-s/Dotfiles.git
cp -r Dotfiles/.config/fish ~/.config
cp Dotfiles/.config/starship.toml ~/.config
cp -r Dotfiles/.config/bat ~/.config
```
