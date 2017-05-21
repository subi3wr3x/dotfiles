### Enable RPMFusion

```
$ sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
```

### Steam

```
$ sudo dnf config-manager --add-repo=http://negativo17.org/repos/fedora-steam.repo
$ sudo dnf -y install steam
$ sudo setsebool -P allow_execheap 1
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

### Add "packagecount" alias:

```
$ vi ~/.bashrc
```
add to the bottom:

`alias packagecount='rpm -qa | wc -l'`


### Auto mount storage drive:

```
$ sudo mkdir /mnt/Storage/
$ sudo vi /etc/fstab
```
add to the bottom:

`UUID=F046-D108 /mnt/Storage/ vfat user,rw,umask=000,dmask=000 0 0`


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

### Install Gimp, mpv, youtube-dl, Transmission, GNOME Music

```
$ sudo dnf install gimp mpv youtube-dl transmission-gtk gnome-music gnome-tweak-tool
```


### Firefox "Open With"
mpv:
`--no-resume-playback`

youtube-dl:
`-o ~/Videos/%(title)s.%(ext)s`
