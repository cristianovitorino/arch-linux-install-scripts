#!/bin/bash

ln -sf /usr/share/zoneinfo/Brazil/East /etc/localtime
hwclock --systohc --utc
sed -i '177s/.//' /etc/locale.gen
sed -i '393s/.//' /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo "KEYMAP=us-acentos" >> /etc/vconsole.conf
echo "desktop" >> /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 arch.localdomain arch" >> /etc/hosts
echo root:<password> | chpasswd

sed -i '92s/.//' /etc/pacman.conf
sed -i '93s/.//' /etc/pacman.conf
pacman -Syu --noconfirm

pacman -S grub grub-btrfs efibootmgr networkmanager network-manager-applet dialog wpa_supplicant mtools dosfstools reflector base-devel linux-headers avahi xdg-user-dirs xdg-utils gvfs gvfs-smb nfs-utils inetutils dnsutils bluez bluez-utils cups hplip alsa-utils pipewire pipewire-alsa pipewire-pulse pipewire-jack bash-completion openssh rsync reflector acpi acpi_call edk2-ovmf bridge-utils dnsmasq vde2 openbsd-netcat iptables-nft ipset firewalld flatpak sof-firmware nss-mdns acpid os-prober ntfs-3g terminus-font

# pacman -S --noconfirm xf86-video-amdgpu
pacman -S --noconfirm nvidia nvidia-utils nvidia-settings

grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable NetworkManager
systemctl enable bluetooth
systemctl enable cups.service
systemctl enable sshd
systemctl enable avahi-daemon
systemctl enable reflector.timer
systemctl enable fstrim.timer
systemctl enable firewalld
systemctl enable acpid

useradd -m archlinux
echo archlinux:<password> | chpasswd
echo "archlinux ALL=(ALL) ALL" >> /etc/sudoers.d/archlinux


printf "\e[1;32mDone! Type exit, umount -a and reboot.\e[0m"