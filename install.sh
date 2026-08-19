#!/usr/bin/env bash

root=$(realpath $(dirname $0))

sudo pacman -Sy --needed --noconfirm - < $root/packages.txt

mkdir -p ~/.config/nvim

cat $root/configs.txt | while read -r dst src; do
	ln -sfTv $root/config/$dst ~/$src
done

cat << EOF | sudo systemctl edit --stdin getty@tty1.service
[Service]
ExecStart=
ExecStart=-/usr/bin/agetty -o '-p -f -- \u' --noclear --autologin $USER %I $TERM
EOF

sudo sed '/HandleLidSwitch/ { s/#//; s/=.*$/=ignore/; }' -i /etc/systemd/logind.conf

nvim -c :UpdatePlugins -c :q

systemctl --user --now enable pipewire pipewire-pulse wireplumber

gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita'

fastfetch

