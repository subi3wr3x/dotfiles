#!/bin/sh

# enable RPM Fusion "free" repo:
sudo dnf -y install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-'$(rpm -E %fedora)'.noarch.rpm

# enable Nvidia repo and install driver:
sudo dnf -y install fedora-workstation-repositories
sudo dnf -y config-manager --set-enabled rpmfusion-nonfree-nvidia-driver
sudo dnf -y install xorg-x11-drv-nvidia akmod-nvidia && sudo dnf upgrade -y
sudo grubby --update-kernel=ALL --args='nvidia-drm.modeset=1'

# fix font rendering:
sudo ln -s /usr/share/fontconfig/conf.avail/10-hinting-slight.conf /etc/fonts/conf.d/
sudo ln -s /usr/share/fontconfig/conf.avail/10-sub-pixel-rgb.conf /etc/fonts/conf.d/
sudo ln -s /usr/share/fontconfig/conf.avail/11-lcdfilter-default.conf /etc/fonts/conf.d/
gsettings set org.gnome.settings-daemon.plugins.xsettings antialiasing 'rgba'
gsettings set org.gnome.settings-daemon.plugins.xsettings hinting 'slight'

# add aliases:
cat <<EOF >> ~/.bashrc
alias packagecount='dnf list installed | wc -l'
alias clearswap='sudo swapoff -a && sudo swapon -a'
alias fullupdate='sudo dnf upgrade -y && sudo dnf autoremove -y && sudo dnf clean all'

ytclip () {
  ffmpeg -i "$(youtube-dl -f best -g "$3")" -ss $1 -to $2 -async 1 ~/Videos/clip.mp4
}
EOF

# auto-mount storage drive:
sudo mkdir /mnt/Storage/
sudo bash -c 'echo -e "UUID=bb1a411a-278e-4218-ab85-fb31bc3807fb /mnt/Storage ext4 defaults 0 0" >> /etc/fstab'
sudo mount -a

# symlink music from storage drive
ln -s /mnt/Storage/Music/ ~/Music/

# set swappiness value to 10
echo 'vm.swappiness = 10' | sudo tee -a /etc/sysctl.d/99-sysctl.conf

# install/Remove software:
sudo dnf -y install gnome-music gnome-tweak-tool transmission-gtk mpv youtube-dl ffmpeg compat-ffmpeg28
sudo dnf -y remove gnome-maps gnome-photos rhythmbox gnome-weather cheese gnome-clocks gnome-contacts gnome-documents totem gdouros-symbola-fonts

# enable Flathub and install software:
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub com.discordapp.Discord -y
flatpak install flathub com.spotify.Client -y
flatpak install flathub com.valvesoftware.Steam -y
