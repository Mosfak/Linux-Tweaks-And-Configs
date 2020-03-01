#!/bin/bash

# Ubuntu (GNOME) 18.04 setup script.

dpkg -l | grep -qw gdebi || sudo apt-get install -yyq gdebi

# Initial Software

sudo apt update

sudo apt install virtualbox virtualbox-guest-additions-iso virtualbox-ext-pack \
net-tools htop lame git mc flatpak audacity \
openssh-server sshfs gedit-plugin-text-size simplescreenrecorder nano \
ubuntu-restricted-extras mpv vlc gthumb gnome-tweaks \
gnome-tweak-tool qt5-style-plugins spell synaptic -yy

# Add me to any groups I might need to be a part of:

sudo adduser $USER vboxusers
sudo adduser $USER input

# Remove undesirable packages:

#sudo apt purge gstreamer1.0-fluendo-mp3 deja-dup shotwell whoopsie whoopsie-preferences -yy

# Remove snaps and get packages from apt:

sudo snap remove gnome-characters gnome-calculator gnome-system-monitor -y
sudo apt install gnome-characters gnome-calculator gnome-system-monitor \
gnome-software-plugin-flatpak -yy

#install chromium
sudo apt install chromium-browser -y

#gsettings set com.ubuntu.update-notifier show-livepatch-status-icon false
#set icons to minimize on click
#gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'

## Remove junk
sudo apt-get remove ubuntu-web-launchers -y 
sudo apt remove thunderbird -y
sudo apt remove rhythmbox -y

## Multimedia
echo "\nHi There! Be patient please! ^_^\n"
sleep 10

sudo apt-get install -y gimp scribus
echo "Installing kdenlive and blender"
sleep 6
sudo apt install kdenlive blender -y

echo "\nInstalling Sublime Text:\n"
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.sublimetext.com/sublimehq-pub.gpg
sudo apt-key add -
sudo add-apt-repository "deb https://download.sublimetext.com/ apt/stable/"
sudo apt update
sudo apt install sublime-text -y
echo "Sublime Done"

sudo apt install htop -y
sudo apt install inkscape -y
sudo apt install vlc -y

#transmission
sudo add-apt-repository ppa:transmissionbt/ppa
sudo apt-get update
sudo apt-get install transmission-gtk transmission-cli transmission-common transmission-daemon -y






## Games
#sudo apt-get install -y steam-installer

## Disable Apport
#sudo sed -i 's/enabled=1/enabled=0/g' /etc/default/apport

# Gotta reboot now:
sudo apt update && sudo apt upgrade -y

echo $'\n'$"*** All done! Please reboot now. ***"