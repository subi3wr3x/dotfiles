# Enable RPM Fusion "free" repo:
sudo dnf -y install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm

# Enable Nvidia repo, install driver, and set GDM to use Xorg:
sudo dnf -y install fedora-workstation-repositories
sudo dnf -y config-manager --set-enabled rpmfusion-nonfree-nvidia-driver
sudo dnf -y install xorg-x11-drv-nvidia akmod-nvidia && sudo dnf update -y
sudo sed -i '/WaylandEnable=false/s/^#//' /etc/gdm/custom.conf

# Fix font rendering:
sudo dnf -y install freetype-freeworld
sudo ln -s /usr/share/fontconfig/conf.avail/10-hinting-slight.conf /etc/fonts/conf.d/
sudo ln -s /usr/share/fontconfig/conf.avail/10-sub-pixel-rgb.conf /etc/fonts/conf.d/
sudo ln -s /usr/share/fontconfig/conf.avail/11-lcdfilter-default.conf /etc/fonts/conf.d/
sudo ln -s /usr/share/fontconfig/conf.avail/70-no-bitmaps.conf /etc/fonts/conf.d/
gsettings set org.gnome.settings-daemon.plugins.xsettings antialiasing "rgba"
gsettings set org.gnome.settings-daemon.plugins.xsettings hinting "slight"

# Add aliases:
echo "alias packagecount='rpm -qa | wc -l'" >> ~/.bashrc
echo "alias clearswap='sudo swapoff -a && sudo swapon -a'" >> ~/.bashrc
echo "alias fullupdate='sudo dnf update -y && sudo dnf autoremove -y && sudo dnf clean all && flatpak update'" >> ~/.bashrc

# Auto-mount storage drive:
sudo mkdir /mnt/Storage/
sudo bash -c 'echo -e "UUID=058D8AF8507F01D9 /mnt/Storage ntfs defaults 0 0" >> /etc/fstab'
sudo mount -a

# Symlink music from storage drive
ln -s /mnt/Storage/Music/ ~/Music/

# Set SELinux to permissive mode:
# sudo setenforce 0

# Install/Remove software:
sudo dnf -y install gnome-music gnome-tweak-tool transmission-gtk mpv youtube-dl compat-ffmpeg28
sudo dnf -y remove gnome-maps gnome-photos rhythmbox gnome-weather cheese

# Enable Flathub and install software:
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub com.discordapp.Discord -y
flatpak install flathub com.spotify.Client -y
flatpak install flathub com.valvesoftware.Steam -y
