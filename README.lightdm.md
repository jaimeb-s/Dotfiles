# Lightdm

Instalar un nuevo greeter y un tema.

```bash
sudo pacman -S lightdm-webkit2-greeter
paru -S lightdm-webkit-theme-aether
```

Y editar lo siguiente.

```bash
# /etc/lightdm/lightdm.conf
[Seat:*]
greeter-session = lightdm-webkit2-greeter

# /etc/lightdm/lightdm-webkit2-greeter.conf
[greeter]
webkit_theme = lightdm-webkit-theme-aether
```