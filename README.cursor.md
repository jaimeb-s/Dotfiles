# Cursor

Instalar un tema de [cursor](https://wiki.archlinux.org/title/Cursor_themes).

Para descargar temas manualmente, [aqui](https://www.gnome-look.org/browse?cat=107&ord=latest).

Para instalar otro tema de cursor, ver [Cursores favoritos](#cursores-favoritos).

```bash
# AUR
paru -S bibata-extra-cursor-theme

# Manual
cd Downloads
sudo tar -xvf name-cursor-theme.tar.gz -C /usr/share/icons/
```

_Colocar el nombre como aparecen en **/usr/share/icons**_

Editar */usr/share/icons/default/index.theme*.

```bash
[Icon Theme]
Inherits=Bibata-Modern-DodgerBlue
```

Editar *~/.gtkrc-2.0*

```bash
gtk-cursor-theme-name="Bibata-Modern-DodgerBlue"
```

Editar *~/.config/gtk-3.0/settings.ini*.

```bash
[Settings]
gtk-cursor-theme-name=Bibata-Modern-DodgerBlue
```

# Cursores favoritos

| Cursor                                                                                            |
|--------------------------------------------------------------                                     |
| [ballrgb](https://github.com/spzdoom/BALLRGB/tree/main/ballrgb)                                   |
| [bibata-cursor-theme](https://aur.archlinux.org/packages/bibata-cursor-theme) AUR                 |
| [bibata-extra-cursor-theme](https://aur.archlinux.org/packages/bibata-extra-cursor-theme/) AUR    |
| [Fossa](https://gnome-look.org/p/1377483)                                                         |
| [layan-cursor-theme-git](https://aur.archlinux.org/packages/layan-cursor-theme-git) AUR           |
| [oreo-cursors-git](https://aur.archlinux.org/packages/oreo-cursors-git/) AUR                      |
| [vimix-cursors](https://aur.archlinux.org/packages/vimix-cursors/) AUR                            |
| [volantes-cursors](https://aur.archlinux.org/packages/volantes-cursors) AUR                       |