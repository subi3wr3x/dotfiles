sudo apt update && sudo apt upgrade -y && sudo apt dist-upgrade -y && sudo apt autoremove -y
sudo apt install xorg i3 firefox fonts-hack-ttf lxappearance pcmanfm fonts-font-awesome adwaita-icon-theme-full
mkdir ~/.config/
mkdir ~/.config/i3/
mkdir ~/.config/i3status/
wget http://raw.githubusercontent.com/iBurley/dotfiles/master/.xinitrc
wget http://raw.githubusercontent.com/iBurley/dotfiles/master/.Xresources
wget http://raw.githubusercontent.com/iBurley/dotfiles/master/.vimrc
wget http://raw.githubusercontent.com/iBurley/dotfiles/master/.config/i3/config
mv config ~/.config/i3/config
wget http://raw.githubusercontent.com/iBurley/dotfiles/master/.config/i3status/config
mv config ~/.config/i3status/config
