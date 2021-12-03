#!/bin/bash

## Install tools

#docker, go,etc

#xclip
sudo apt install xclip

#bat & extras
sudo apt install bat
git clone https://github.com/eth-p/bat-extras.git && cd bat-extras && ./build.sh
mv ./bin/* ~/.local/bin/

#fd
sudo apt install fd-find
ln -s $(which fdfind) ~/.local/bin/fd
