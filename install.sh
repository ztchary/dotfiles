#!/usr/bin/env bash

root=$(realpath $(dirname $0))
cd $root

mkdir -p ~/.config
ln -s $root/.config/hypr ~/.config/hypr
ln -s $root/.config/alacritty ~/.config/alacritty
ln -s $root/.config/eww ~/.config/eww
ln -s $root/.config/wofi ~/.config/wofi
ln -s $root/.bashrc ~/.bashrc
ln -s $root/.bash_profile ~/.bash_profile
ln -s $root/.vimrc ~/.vimrc
sudo ln -s $root/systemd/getty@tty1.service /etc/systemd/system/getty@tty1.service

