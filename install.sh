#!/usr/bin/env bash

root=$(realpath $(dirname $0))
cd $root

mkdir -p ~/.config/nvim
ln -s $root/.config/hypr          ~/.config
ln -s $root/.config/alacritty     ~/.config
ln -s $root/.config/waybar        ~/.config
ln -s $root/.config/wofi          ~/.config
ln -s $root/.config/btop          ~/.config
ln -s $root/.config/nvim/init.lua ~/.config/nvim
ln -s $root/.bashrc               ~
ln -s $root/.bash_profile         ~
sudo ln -s $root/systemd/getty@tty1.service /etc/systemd/system/getty@tty1.service

