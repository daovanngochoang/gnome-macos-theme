#!/bin/bash


home=$(pwd)

#update dnf
echo "Update ... "
echo "-----------------------------------------------------------------------------------------------------------------"
sudo dnf update


echo "Installing custom theme and config work space"
echo "-----------------------------------------------------------------------------------------------------------------"

#Install alacritty
sudo dnf install alacritty -y

rm ~/.oh-my-zsh -rf
#install zsh and ohmyzsh
sudo dnf install zsh -y
#wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
#sh install.sh

#install theme, fonts and  ...
rm ~/.oh-my-zsh -rf
echo "delete ohmyzsh"
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

sudo dnf install gnome-tweaks


echo " "
echo " "
echo "Configure the Coding Environment ..."
echo " "
echo " "

#install brave
echo "Installing Brave Browser"
echo "-----------------------------------------------------------------------------------------------------------------"
sudo dnf install dnf-plugins-core

sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/

sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc

sudo dnf install brave-browser


echo "Installing Coding Environment"

#install docker
echo "Installing Docker"
echo "-----------------------------------------------------------------------------------------------------------------"

sudo dnf -y install dnf-plugins-core
sudo dnf config-manager \
    --add-repo \
    https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf install docker-ce docker-ce-cli containerd.io docker-compose-plugin


#Install donet
echo "Installing dotnet6.0 and asp.net core 3.1"
echo "-----------------------------------------------------------------------------------------------------------------"
sudo dnf install dotnet-sdk-6.0
sudo dnf install dotnet-sdk-3.1

echo "Installing JetBrains Rider"
echo "-----------------------------------------------------------------------------------------------------------------"
firefox https://www.jetbrains.com/rider/download/download-thanks.html?platform=linux https://az764295.vo.msecnd.net/stable/6261075646f055b99068d3688932416f2346dd3b/code-1.73.1-1667967421.el7.x86_64.rpm


mkdir ~/.Programs
#cp ~/Download/JetBrains.Rider-2022.2.4.tar.gz ~/.Programs
#cd ~/.Programs
#tar -xvf ~/.Programs/JetBrains.Rider-2022.2.4.tar.gz

cd ~/Download && sudo dnf install ./code-1.73.1-1667967421.el7.x86_64.rpm







