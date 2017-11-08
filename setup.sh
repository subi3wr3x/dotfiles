sudo apt update && sudo apt upgrade -y && sudo apt dist-upgrade -y && sudo apt autoremove -y

sudo apt install xorg i3 firefox fonts-hack-ttf lxappearance pcmanfm 

mkdir ~/.config/

mkdir ~/.config/i3/

mkdir ~/.config/i3status/

curl http://raw.githubusercontent.com/iBurley/dotfiles/master/.xinitrc > ~/.xinitrc

curl http://raw.githubusercontent.com/iBurley/dotfiles/master/.Xresources > ~/.Xresources

curl http://raw.githubusercontent.com/iBurley/dotfiles/master/.vimrc > ~/.vimrc

curl http://raw.githubusercontent.com/iBurley/dotfiles/master/.config/i3/config > ~/.config/i3/config

curl http://raw.githubusercontent.com/iBurley/dotfiles/master/.config/i3status/config > ~/.config/i3status/config
