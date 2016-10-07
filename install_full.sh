#!/bin/sh


# Made by Brandon Whitehead
# Edited for macOS Sierra by Grayson Bianco


# Stop on any error
set -e
echo >&2 "Installing Homebrew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
echo >&2 "Installing CMake"
brew install CMake
sudo ./install.sh
