#!/bin/bash

sudo timedatectl set-ntp true
sudo hwclock --systohc --utc

sudo reflector -c Brazil -a 12 --sort rate --save /etc/pacman.d/mirrorlist
sudo pacman -Syy

sudo firewall-cmd --add-port=1025-65535/tcp --permanent
sudo firewall-cmd --add-port=1025-65535/udp --permanent
sudo firewall-cmd --reload

sudo pacman -S --noconfirm xorg gnome gnome-tweaks nautilus-sendto gnome-software-packagekit-plugin seahorse seahorse-nautilus chrome-gnome-shell otf-ipafont nerd-fonts-noto-sans-mono noto-fonts noto-fonts-emoji noto-fonts-extra adobe-source-sans-pro-fonts ttf-opensans ttf-bitstream-vera ttf-dejavu ttf-cascadia-code ttf-fira-code ttf-jetbrains-mono inter-font nautilus-image-converter seahorse-nautilus sushi p7zip bat fish git qbittorrent neofetch kvantum-qt5 vivaldi-ffmpeg-codecs alacritty

sudo systemctl enable gdm
/bin/echo -e "\e[1;32mREBOOTING IN 5..4..3..2..1..\e[0m"
sleep 5
sudo reboot