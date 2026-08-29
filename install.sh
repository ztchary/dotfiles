#!/usr/bin/env bash

root=$(realpath $(dirname $0))

sudo pacman -Sy --needed --noconfirm - < $root/packages.txt

mkdir -p ~/.config/nvim

ln -sfTv $root/config/alacritty      ~/.config/alacritty
ln -sfTv $root/config/gtk            ~/.config/gtk-3.0
ln -sfTv $root/config/gtk            ~/.config/gtk-4.0
ln -sfTv $root/config/hypr           ~/.config/hypr
ln -sfTv $root/config/nvim/init.lua  ~/.config/nvim/init.lua
ln -sfTv $root/config/waybar         ~/.config/waybar
ln -sfTv $root/config/wofi           ~/.config/wofi
ln -sfTv $root/config/user-dirs.dirs ~/.config/user-dirs.dirs
ln -sfTv $root/config/bashrc         ~/.bashrc
ln -sfTv $root/config/bash_profile   ~/.bash_profile

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

