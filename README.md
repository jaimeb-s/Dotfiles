# Dotfiles

![xmonad](.screenshot/xmonad.png)

# Indice

- [AUR](#aur)
- [Xorg](#xorg)
- [Contolador de pantalla](#controlador-de-pantalla)
- [Administrador de ventana](#administrador-de-ventana)
- [Gestor de pantalla](#gestor-de-pantalla)
- [Directorios de usuario](#directorios-de-usuario)
- [Audio](#audio)
- [Driver wifi](#driver-wifi)
- [Wifi](#wifi)
- [Xprofile](#xprofile)
- [Archivos comprimidos](#archivos-comprimidos)
- [Unidades externas](#unidades-externas)
- [Bloq Num](#bloq-num)
- [Notificaciones](#notificaciones)
- [MTP](#mtp)
- Configuraciones
    - [Xmonad](https://github.com/jaimeb-s/Dotfiles/tree/main/.xmonad)
    - [Alacritty](https://github.com/jaimeb-s/Dotfiles/tree/main/.config/alacritty)
    - [Lightdm](README.lightdm.md)
    - [Rofi](https://github.com/jaimeb-s/Dotfiles/tree/main/.config/rofi)
    - [Fish](https://github.com/jaimeb-s/Dotfiles/tree/main/.config/fish)
    - [Cursor](README.cursor.md)
    - [GTK](README.gtk.md)
    - [Grub](README.grub.md)
    - [Code](https://github.com/jaimeb-s/Dotfiles/tree/main/.config/Code-OSS/)
    - [Nvim](https://github.com/jaimeb-s/Dotfiles/tree/main/.config/nvim)

# AUR
Instalar un ayudante de AUR, en este caso instalar **[paru](https://github.com/morganamilo/paru)**.

```bash
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
```

# Xorg

Instalar **[xorg](https://wiki.archlinux.org/title/Xorg)** para ejecutar aplicaciones con interfaz grafica.

```bash
sudo pacman -S xorg
```

# Controlador de pantalla

Identificar la tarjeta grafica e [instalar un controlador](https://wiki.archlinux.org/title/Xorg#Driver_installation) apropiado.

```bash
# Controlador para AMD
sudo pacman -S xf86-video-amdgpu
```

# Administrador de ventana

Instalar **[xmonad](https://wiki.archlinux.org/title/Xmonad)** como el administrados de ventanas, y **[alacritty](https://archlinux.org/packages/community/x86_64/alacritty/)** como emulador de terminal.

```bash
sudo pacman -S xmonad xmonad-contrib alacritty
```

Crear el archivo _~/.xmonad/xmonad.hs_ y agregar lo siguiente

```hs
import XMonad

myTerminal = "alacritty"
myModMask = mod4Mask

main = do
	xmonad $ def
		{
			terminal = myTerminal
			, modMask = myModMask
		}
```
Para configurarlo, click [aqui](https://github.com/jaimeb-s/Dotfiles/tree/main/.xmonad)

# Gestor de pantalla

Para iniciar sesion, instalar **[lightdm](https://wiki.archlinux.org/title/LightDM#Installation)** y un greeter para lightdm.

```bash
sudo pacman -S lightdm lightdm-gtk-greeter
# habilitar lightdm
sudo systemctl enable lightdm
```

Si prefiere configurarlo, ingrese [aqui](README.lightdm.md).

# Directorios de usuario

Para crear los directorios de usuario instalar **[xdg-users-dirs](https://archlinux.org/packages/extra/x86_64/xdg-user-dirs/)**.

```bash
sudo pacman -S xdg-user-dirs
# Copiar los archivos
git clone https://github.com/jaimeb-s/Dotfiles.git
cp Dotfiles/.config/user-dirs.* ~/.config
# crear los directorios
xdg-user-dirs-update
```

# Audio 

Instalar **[pulseaudio](https://wiki.archlinux.org/title/PulseAudio#Installation)** y **[pavucontrol](https://archlinux.org/packages/extra/x86_64/pavucontrol/)** para controlar el audio.

```bash
sudo pacman -S pulseaudio pavucontrol
```

# Driver wifi

Instalar los drivers **[rtl8821ce-dkms-git](https://github.com/tomaspinho/rtl8821ce)** en caso de tener una tarjeta de red **rtl8821ce**.

```bash
sudo pacman -S dkms base-devel bc linux-headers
paru rtl8821ce-dkms-git
sudo modprobe 8821ce
systemctl restart NetworkManager.service
```

# Wifi

Conectar a la red wifi.

```bash
# Listar las redes
nmcli device wifi list
# Conectar a la red
nmcli device wifi connect TU_SSID password TU_CONTRASEÑA
```

# xprofile

Instalar **[xinit](https://wiki.archlinux.org/title/Xinit#Installation)** para iniciar programas.

```bash
sudo pacman -S xorg-xinit
```

Crear el archivo _~/.xprofile_ y agregar lo siguiente para cambiar la distrubucion de teclado.

```bash
setxkbmap latam &
```

# Archivos comprimidos
Para comprimir y descomprimir archivos instalar **[zip](https://archlinux.org/packages/extra/x86_64/zip/)** y **[unzip](https://archlinux.org/packages/extra/x86_64/unzip/)**

```bash
sudo pacman -S zip unzip
# Comprimir
zip archivo.zip archivo-a-comprimir
# Descomprimir
unzip archivo.zip
```

# Unidades externas

Para montar automaticamente las unidades externas instalar **[udiskie](https://archlinux.org/packages/community/any/udiskie/)** y **[ntfs-3g](https://wiki.archlinux.org/title/NTFS-3G)** para leer y escribir en discos NTFS, y agragar a el _~/.xprofile_.

```bash
sudo pacman -S udiskie ntfs-3g
# ~/.xprofile
udiskie -t &
```

# Bloq Num

Para activar la tecla Num Lock, instalar **[numlockx](https://archlinux.org/packages/community/x86_64/numlockx/)** y editar los siguientes archivos.

```bash
sudo pacman -S numlockx
# ~/.xprofile
numlockx &
# /etc/lightdm/lightdm.conf
[Seat:*]
greeter-setup-script=/usr/bin/numlockx on
```

# Notificaciones

Para tener [notificaciones de escritorio](https://wiki.archlinux.org/title/Desktop_notifications), instalar [libnotify](https://archlinux.org/packages/extra/x86_64/libnotify/) y [notification-daemon](https://archlinux.org/packages/community/x86_64/notification-daemon/). Crear el siguiente archivo.

```bash
# /usr/share/dbus-1/services/org.freedesktop.Notifications.service
[D-BUS Service]
Name=org.freedesktop.Notifications
Exec=/usr/lib/notification-daemon-1.0/notification-daemon
```

# MTP

Para conectar tu computadora a un dispositivo, instalar [simple-mtpfs](https://aur.archlinux.org/packages/simple-mtpfs/).

```bash
sudo pacman -S libmtp
paru -S simple-mtpfs

mkdir ~/mnt

# Listar dispositivos
simple-mtpfs -l
# Montar el primer dispositivo en ~/mnt 
simple-mtpfs --device 1 ~/mnt
# Desmontar
fusemount -u ~/mnt

```
