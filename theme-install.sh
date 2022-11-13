#!/bin/bash


#fix slow dnf 
echo "Fix dnf slow connection"
echo "-----------------------------------------------------------------------------------------------------------------"
sudo echo "fastestmirror=true" >> /etc/dnf/dnf.conf
sudo echo "max_parallel_downloads=20" >> /etc/dnf/dnf.conf
sudo echo "deltarpm=1" >> /etc/dnf/dnf.conf
sudo echo "ip_resolve=4" >> /etc/dnf/dnf.conf

#update dnf
echo "Update ... "
echo "-----------------------------------------------------------------------------------------------------------------"
sudo dnf update


#install brave
echo "Installing Brave Browser"
echo "-----------------------------------------------------------------------------------------------------------------"
sudo dnf install dnf-plugins-core

sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/

sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc

sudo dnf install brave-browser

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


echo "Installing custom theme and config work space"
echo "-----------------------------------------------------------------------------------------------------------------"

#Install alacritty
dnf install alacritty


#install zsh and ohmyzsh
sudo dnf install zsh
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
sh install.sh

#install theme, fonts and  ...
rm ~/oh-my-zsh
cd ~/Download/

brave-browser https://doc-0k-5k-docs.googleusercontent.com/docs/securesc/r9mcefjqbbcj2753777t069se4hc24eb/4j7ei2g0f3hvk2ar7hdg0pgvdaceh68j/1668251025000/16211908321045967092/16211908321045967092/1NYk-M3YhmXCZz3BXB9EO2urM4aXCxnEP?e=download&ax=AEKYgySrlyagMRCjO48nRIZSC5xpzD9m5p58gzJmwNOPqOXKf04JvSzx5WMs9qCd1qI40NV8tYqFrKXYrzZHwMG6J2ndhLiB_CxAGCzkutRDvrKTkolHl1Dpb90qeOBveWzUZqnW76bnmZBVR94FgYNblOWkHKz3NxWZR5MQt_fa2DVOTWUqhz2fxiDtYQRtUop4VtVObDI02Ok_n51OdKieYC4Ws0M94PvR3QR-H4gkuFtqYL4AaRFtQrtkdtp4qIq8ussmvJP-s9avIoEhNJ79NfQyP35sAjZCPNyFooZFTsCgNDdj5hsVFT6mf4L3Ot75fd9GiofM64Vtah2zTcAjFOom8Bo8c_n5qIYkF54q3gS5xwfi8VjU27ghlMGz2e3OTJwWMkO0sh6IWC-L1DiFfIeAezoze5uiTtFjw0ZiXo7hBsFX_n4MyCp7GaMOKEDzgDLw0Rw6Mq5rB_GetAnc8MI-gltFFqzquVSklOZSVv_F-xUi59OWsPuGdMCn40jiccI7m7XV1LmdRq1bjU7hYgMobXIQmitnnlFaAyHLJCT1eDLxvoew06M45jbbbAlRas5HdHNN8EMPbfmbeuqrHr4MrOVfbaUBjRn6MQjYQPN8k7C6_tdGWeqBPjhqIktFSpfehi8SfV2FpFc0VT_Usj0TsfpohXTUEyUWreu1Bjj6v-N-GZslHDdQTQygE0Kaj7GG83FyPaaXrY3fA-sLc0IJdjoz2ULFchJMACQLWauKzFMZTPTaPCzP8etQKhrvkjuzIbiR9PZbGlDqMy0JSVuRHlCpPzDfysVDArhhi72ihpE-LLKrGnWfA1hLu1uTujdTTFjAiCRQ-8ckL1VF02TfKEkCvlImrmz0OY7O1x_DYXGBz2zDkHrShX34hnEZnQ&uuid=cd75cb16-bd4c-47ac-a46e-18f25a8c3960&authuser=0&nonce=976i9cqepg5t2&user=16211908321045967092&hash=pmlk0g6ejif75mv3gh25ka7jgjhq783l 

unzip theme-latest.zip
cd theme-latest
cp -r alacritty/ ~/.config/
cp -r gtk-3.0/gtk.css ~/.config/gtk-3.0/
cp -r .icons/ ~
cp -r .fonts/ ~
cp -r .oh-my-zsh/ ~

nano ~/.zshrc


p10k configure

sudo dnf install gnome-tweaks


