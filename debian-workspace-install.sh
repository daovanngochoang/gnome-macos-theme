#!/bin/bash


home=$(pwd)

#update dnf
echo "Update ... "
echo "-----------------------------------------------------------------------------------------------------------------"
sudo nala update


echo "Installing custom theme and config work space"
echo "-----------------------------------------------------------------------------------------------------------------"

#Install alacritty

sudo add-apt-repository ppa:aslatter/ppa -y
sudo nala install alacritty -y

sudo nala install imwheel 
cp .imwheelrc ~

sudo gpasswd -a $USER input
newgrp input
sudo nala install libinput-tools ruby xdotool
sudo gem install fusuma


sudo snap remove --purge firefox
sudo snap remove --purge snap-store
sudo snap remove --purge gnome-3-38-2004
sudo snap remove --purge gtk-common-themes
sudo snap remove --purge snapd-desktop-integration
sudo snap remove --purge bare
sudo snap remove --purge core20
sudo snap remove --purge snapd
sudo apt remove --autoremove snapd

wget https://download-installer.cdn.mozilla.net/pub/firefox/releases/107.0/linux-x86_64/en-US/firefox-107.0.tar.bz2
sudo tar xjf firefox-107.0.tar.bz2 -C /opt/
sudo ln -s /opt/firefox/firefox /usr/local/bin/firefox

rm ~/.oh-my-zsh -rf
rm ~/.zshrc 


#install zsh and ohmyzsh
sudo nala install zsh -y
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
sh install.sh

#exit

#install theme, fonts and  ...
wget https://github.com/andreas-aka-hoangdao/gnome-macos-theme/releases/download/MacOS-Bigsur-Theme/MacOS-Bigsur-Theme.zip
wait 

unzip MacOS-Bigsur-Theme.zip

cd MacOS-Bigsur-Theme

rm ~/.oh-my-zsh -rf
rm ~/.zshrc 

cp -r alacritty/ ~/.config/
cp -r gtk.css ~/.config/gtk-3.0/
cp -r .icons/ ~
cp -r .fonts/ ~
cp -r .oh-my-zsh/ ~ 
cp .zshrc ~

zsh
source ~/.zshrc

p10k configure

echo "Installing MacOS Theme ..."
echo "-----------------------------------------------------------------------------------------------------------------"
./theme/WhiteSur-gtk-theme/install.sh
sudo nala install gnome-tweaks -y


echo " "
echo " "
echo "Configure the Coding Environment ..."
echo " "
echo " "

#install brave
echo "Installing Brave Browser"
echo "-----------------------------------------------------------------------------------------------------------------"
sudo nala install apt-transport-https curl

sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

sudo nala update

sudo nala install brave-browser


echo "Installing Coding Environment"

#install docker
echo "Installing Docker"
echo "-----------------------------------------------------------------------------------------------------------------"

sudo nala install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo nala update 
sudo apt-cache policy docker-ce
sudo apt install docker-ce 

mkdir -p ~/.docker/cli-plugins/
curl -SL https://github.com/docker/compose/releases/download/v2.3.3/docker-compose-linux-x86_64 -o ~/.docker/cli-plugins/docker-compose
chmod +x ~/.docker/cli-plugins/docker-compose


#Install donet
echo "Installing dotnet6.0 and asp.net core 3.1"
echo "-----------------------------------------------------------------------------------------------------------------"
sudo nala install dotnet6


echo "Installing JetBrains Rider"
echo "-----------------------------------------------------------------------------------------------------------------"
firefox https://www.jetbrains.com/rider/download/download-thanks.html?platform=linux https://az764295.vo.msecnd.net/stable/6261075646f055b99068d3688932416f2346dd3b/code_1.73.1-1667967334_amd64.deb

mkdir ~/.Programs
#cp ~/Download/JetBrains.Rider-2022.2.4.tar.gz ~/.Programs
#cd ~/.Programs
#tar -xvf ~/.Programs/JetBrains.Rider-2022.2.4.tar.gz

#cd ~/Download && sudo dnf install ./code-1.73.1-1667967421.el7.x86_64.deb
 rm install.sh MacOS-Bigsur-Theme MacOS-Bigsur-Theme.zip






