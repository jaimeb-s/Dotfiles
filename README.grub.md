# Grub

Instalar el tema de [tela](https://github.com/vinceliuice/grub2-themes/) para el grub.

```bash
git clone https://github.com/vinceliuice/grub2-themes.git
# Instala el tema en /boot/grub/themes y agrega el tema en /etc/default/grub
sudo ./install.sh -b -t tela
```

Cambiar la resolucion en _/etc/default/grub_.

```bash
GRUB_GFXMODE=1366X768
```

Cambiar la fuente.

```bash
paru -S nerd-fonts-mononoki
sudo grub-mkfont -s 14 -o /boot/grub/fonts/MononokiNerdFont.pf2 /usr/share/fonts/TTF/mononoki\ Bold\ Nerd\ Font\ Complete.ttf

# Agregar a /etc/default/grub
GRUB_FONT="/boot/grub/fonts/MononokiNerdFont.pf2"
```

Actualizar configuraciones del grub.
```bash
sudo grub-mkconfig -o /boot/grub/grub.cfg
```
