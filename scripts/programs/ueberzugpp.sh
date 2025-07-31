#!/bin/bash

echo 'deb http://download.opensuse.org/repositories/home:/justkidding/xUbuntu_24.04/ /' | sudo tee /etc/apt/sources.list.d/home:justkidding.list
curl -fsSL https://download.opensuse.org/repositories/home:justkidding/xUbuntu_24.04/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home_justkidding.gpg > /dev/null
sudo apt update
sudo apt install ueberzugpp

## TODO: make symbolic link to ~/.config/ueberzug/config.json --> dev/dotfiles/ueberzug/config.json


# ${APT_INSTALL} imagemagick
# ${APT_INSTALL} libmagickwand-dev
