#!/usr/bin/env bash

cd $(dirname $0)

mkdir -p ~/.config
ln -s .config/hypr ~/.config/hypr
ln -s .config/alacritty ~/.config/alacritty
ln -s .config/eww ~/.config/eww
ln -s .config/wofi ~/.config/wofi
ln -s .bashrc ~/.bashrc
ln -s .bash_profile ~/.bash_profile
ln -s .vimrc ~/.vimrc
sudo ln -s systemd/getty@tty1.service /etc/systemd/system/getty@tty1.service

