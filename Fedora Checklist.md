### Enable RPMFusion

```
$ sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
```

### Spotify

```
$ sudo dnf config-manager --add-repo=http://negativo17.org/repos/fedora-spotify.repo
$ sudo dnf -y install spotify-client
```

### Fonts

```
$ sudo dnf -y install freetype-freeworld
$ sudo ln -s /usr/share/fontconfig/conf.avail/10-sub-pixel-rgb.conf /etc/fonts/conf.d/
$ sudo ln -s /usr/share/fontconfig/conf.avail/11-lcdfilter-default.conf /etc/fonts/conf.d/
```

### Add aliases:

```
$ echo "alias packagecount='rpm -qa | wc -l'" >> ~/.bashrc
$ echo "alias fullupdate='sudo dnf update -y && sudo dnf distro-sync -y && sudo dnf autoremove -y && sudo dnf clean all && sudo dnf update -y'" >> ~/.bashrc
```

### Auto mount storage drive:

```
$ sudo mkdir /mnt/Storage/
$ sudo sh -c 'echo -e "UUID=F046-D108\t\t/mnt/Storage/\t\tvfat\tuser,rw,umask=000,dmask=000\t0 0" >> /etc/fstab'
$ sudo mount -a
```

### Symbolic link music:

```
$ ln -s /mnt/Storage/Music/ ~/Music
```

### Discord

```
$ wget -O ~/Downloads/discord-linux.tar.gz "https://discordapp.com/api/download?platform=linux&format=tar.gz"
$ tar -xzvf ~/Downloads/discord-linux.tar.gz -C ~/Downloads/
$ sudo mv ~/Downloads/Discord/ /usr/share/discord/
$ sudo ln -s /usr/share/discord/discord.desktop /usr/share/applications/
$ sudo ln -s /usr/share/discord/discord.png /usr/share/icons/
$ sudo ln -s /usr/share/discord/Discord /usr/bin/discord
$ rm ~/Downloads/discord-linux.tar.gz
```

### Install Atom

```
$ wget -O ~/Downloads/atom.rpm "https://atom.io/download/rpm"
$ sudo dnf -y install ~/Downloads/atom.rpm
$ rm ~/Downloads/atom.rpm
```

### Install GIMP, GNOME Music, GNOME Tweak Tool, Steam, Transmission, mpv, youtube-dl

```
$ sudo dnf install gimp gnome-music gnome-tweak-tool steam transmission-gtk mpv youtube-dl
```

### Firefox "Open With"
mpv:
`--no-resume-playback`

youtube-dl:
`-o ~/Videos/%(title)s.%(ext)s`
