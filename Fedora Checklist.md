#### Enable RPM Fusion "free" repo:
```
$ sudo dnf -y install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
```

#### Fix Font Rendering:
```
$ sudo dnf -y install freetype-freeworld
$ sudo ln -s /usr/share/fontconfig/conf.avail/10-sub-pixel-rgb.conf /etc/fonts/conf.d/
$ sudo ln -s /usr/share/fontconfig/conf.avail/11-lcdfilter-default.conf /etc/fonts/conf.d/
```

#### Add Aliases:
```
$ echo "alias packagecount='rpm -qa | wc -l'" >> ~/.bashrc
$ echo "alias fullupdate='sudo dnf update -y && sudo dnf distro-sync -y && sudo dnf autoremove -y && sudo dnf clean all && flatpak update'" >> ~/.bashrc
```

#### Auto Mount Storage Drive:
```
$ sudo mkdir /mnt/Storage/
$ sudo bash -c 'echo -e "UUID=F046-D108 /mnt/Storage/ vfat user,rw,umask=000,dmask=000 0 0" >> /etc/fstab'
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

#### Install Steam, Spotify, and Discord via Flatpak:
```
$ flatpak install --from https://flathub.org/repo/appstream/com.valvesoftware.Steam.flatpakref 
$ flatpak install --from https://flathub.org/repo/appstream/com.spotify.Client.flatpakref 
$ flatpak install --from https://flathub.org/repo/appstream/com.discordapp.Discord.flatpakref 
```

#### Firefox "Open With":
mpv:
`--no-resume-playback`

youtube-dl (video):
`-o ~/Videos/%(title)s.%(ext)s`

youtube-dl (audio):
`-f bestaudio -o ~/Videos/%(title)s.%(ext)s`
