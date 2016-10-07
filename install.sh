#!/bin/sh


# Made by Brandon Whitehead
# Edited for macOS Sierra by Grayson Bianco


# Stop on any error
set -e


if [ "$(id -u)" != "0" ]; then
	echo "Sorry, you are not root. Use the command sudo ./install.sh"
	exit 1
fi


echo >&2 "Creating dummy directory"
mkdir -p temp
cd temp
echo >&2 "Installing package gcc"
gcc --version || xcode-select --install
echo >&2 "Installing wxWidgets 3.0"
git clone https://github.com/wxWidgets/wxWidgets.git
cd wxWidgets
git checkout WX_3_0_BRANCH
mkdir macbuild
cd macbuild
../configure --enable-unicode --with-osx_cocoa --with-macosx-sdk=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.12.sdk --with-macosx-version-min=10.12 --enable-graphics_ctx --enable-monolithic --enable-compat28 --disable-mediactrl
make -j 4
make install
cd ../..
echo >&2 "Downloading Complx"
git clone https://github.com/TricksterGuy/complx.git
cd complx
echo >&2 "Creating build directory"
mkdir -p build
cd build
echo >&2 "Generating Makefile via cmake"
cmake ..
echo >&2 "Building program"
make
echo >&2 "Installing program"
make install
cd ../../..
echo >&2 "Done, have a nice day!"
