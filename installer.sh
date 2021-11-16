#!/bin/bash

#Custom install script for ubuntu based distros
#Useful template
#https://kevq.uk/how-to-create-a-simple-install-script-in-ubuntu/

#gnome extensions:
#ShellTile by emasab (to ensure corner snapping in window manager)
#dash to dock if wanted

#Need to run this as root
if [ $EUID -ne 0 ]; then
    echo "$0 is not running as root. Try using sudo."
    exit 2
fi

#resizes screen
xrandr --output "Virtual1" --mode 1680x1050

# Add any additional repositories
add-apt-repository universe

#update repos
apt-get update

#enable uncomplicated firewall
ufw enable

# Install apt packages
apt install htop -y
apt install python3 -y
apt install synaptic -y
apt install gnome-tweak-tool -y
apt install chrome-gnome-shell -y
apt install tree -y
apt install inkscape -y
apt install gparted -y
apt install cmatrix -y

# Install any snap packages
  #snap install spotify
  #snap install discord

#Create directories for theming
mkdir ~/.themes
mkdir ~/.icons

#Adding a few aliases to .bashrc
echo -e "\nalias ls ='ls -lah'" >> ~/.bashrc
echo -e "\nalias unzipme='tar -xvzf'" >> ~/.bashrc

# Final message
echo All apps have been installed, script will now quit.

# Exit the script
exit 0
