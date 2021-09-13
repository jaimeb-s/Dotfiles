# GTK

Instalar un tema, un tema de icono y una fuente.

Para descargar temas manualmente, ingresa [aqui](https://www.gnome-look.org/browse?cat=135&ord=latest) y para los iconos [aqui](https://www.pling.com/browse?cat=132&ord=latest).

Para mas temas e iconos, ver [Favoritos](#favoritos).

```bash
# AUR
paru -S juno-theme-git tela-circle-icon-theme-git nerd-fonts-mononoki

# Manual
cd Descargas/
sudo tar -xvf name-theme.tar.xz -C /usr/share/themes/
sudo tar -xvf name-icon.tar.xz -C /usr/share/icons/
```

_Escribir los nombres como muestra **/usr/share/themes/** y **/usr/share/icons/**_

Editar *~/.gtkrc-2.0*

```bash
gtk-theme-name="Juno"
gtk-icon-theme-name="Tela-circle-purple-dark"
gtk-font-name="mononoki Nerd Font 12"
```

Y editar *~/.config/gtk-3.0/settings.ini*

```bash
gtk-theme-name=Juno
gtk-icon-theme-name=Tela-circle-purple-dark
gtk-font-name=mononoki Nerd Font 12
```

# Favoritos

| Tema  | Icono   |
| ----- | ------- |
| [abrus-gtk-theme-git](https://aur.archlinux.org/packages/abrus-gtk-theme-git) AUR     | [Lyra icon theme](https://www.pling.com/p/1460991)|
| [Fancy Gtk Theme](https://www.gnome-look.org/p/1566740)                               | [qogir-icon-theme](https://aur.archlinux.org/packages/qogir-icon-theme) AUR |
| [juno-theme-git](https://aur.archlinux.org/packages/juno-theme-git) AUR               | [tela-circle-icon-theme-git](https://aur.archlinux.org/packages/tela-circle-icon-theme-git/) AUR |
| [kripton-theme-git](https://aur.archlinux.org/packages/kripton-theme-git/) AUR        | |
| [layan-gtk-theme-git](https://aur.archlinux.org/packages/layan-gtk-theme-git) AUR     | |
| [matcha-gtk-theme](https://aur.archlinux.org/packages/matcha-gtk-theme/) AUR          | |
| [mojave-gtk-theme](https://aur.archlinux.org/packages/mojave-gtk-theme) AUR           | |
| [NewSur Gtk Theme](https://www.gnome-look.org/p/1556061)                              | |
| [orchis-theme-git](https://aur.archlinux.org/packages/orchis-theme-git) AUR           | |
| [qogir-gtk-theme](https://aur.archlinux.org/packages/qogir-gtk-theme) AUR             | |
| [sweet-gtk-theme-dark](https://aur.archlinux.org/packages/sweet-gtk-theme-dark/) AUR  | |
