#!/bin/bash

BUILD_PATH=$HOME/.temp/build/paru
mkdir -p $BUILD_PATH

sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git $BUILD_PATH/paru.git
cd $BUILD_PATH/paru.git
makepkg -si

rm -rf $BUILD_PATH
