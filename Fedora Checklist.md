#### Enable RPM Fusion "free" and "nonfree" repos:
```
$ sudo dnf -y install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
```

#### Install Nvidia Drivers and disable Wayland in GDM:
```
sudo dnf -y install xorg-x11-drv-nvidia akmod-nvidia && sudo dnf update -y
sudo sed -i '/WaylandEnable=false/s/^#//' /etc/gdm/custom.conf
```

#### Fix Font Rendering:
```
$ sudo dnf -y install freetype-freeworld
$ sudo ln -s /usr/share/fontconfig/conf.avail/10-hinting-slight.conf /etc/fonts/conf.d/
$ sudo ln -s /usr/share/fontconfig/conf.avail/10-sub-pixel-rgb.conf /etc/fonts/conf.d/
$ sudo ln -s /usr/share/fontconfig/conf.avail/11-lcdfilter-default.conf /etc/fonts/conf.d/
$ sudo ln -s /usr/share/fontconfig/conf.avail/70-no-bitmaps.conf /etc/fonts/conf.d/
```

#### Add Aliases:
```
$ echo "alias packagecount='rpm -qa | wc -l'" >> ~/.bashrc
$ echo "alias clearswap='sudo swapoff -a && sudo swapon -a'" >> ~/.bashrc
$ echo "alias fullupdate='sudo dnf update -y && sudo dnf autoremove -y && sudo dnf clean all && flatpak update -y'" >> ~/.bashrc
```

#### Auto Mount Storage Drive:
```
$ sudo mkdir /mnt/Storage/
$ sudo bash -c 'echo -e "UUID=64a9314e-07d8-47dd-94a6-d1a55851b12d /mnt/Storage/ ext4 defaults 0 0" >> /etc/fstab'
$ sudo mount -a
```

#### Set SELinux to permissive mode:
```
$ sudo sed -i s/^SELINUX=.*$/SELINUX=permissive/g /etc/selinux/config
```

#### Install GNOME Tweaks, Transmission, mpv, and youtube-dl:
```
$ sudo dnf -y install gnome-tweak-tool transmission-gtk mpv youtube-dl
```

#### Install Discord, Steam, and Spotify via Flatpak:
```
$ flatpak install --from https://flathub.org/repo/appstream/com.discordapp.Discord.flatpakref -y
$ flatpak install --from https://flathub.org/repo/appstream/com.valvesoftware.Steam.flatpakref -y
$ flatpak install --from https://flathub.org/repo/appstream/com.spotify.Client.flatpakref -y
```

#### Firefox "Open With":
mpv:
`--no-resume-playback`

youtube-dl (video):
`-o ~/Videos/%(title)s.%(ext)s`

youtube-dl (audio):
`-f bestaudio -o ~/Videos/%(title)s.%(ext)s`
