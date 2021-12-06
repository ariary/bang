#!/bin/bash

## Install tools

#docker, etc

#xclip
sudo apt install xclip

#bat & extras
sudo apt install bat
git clone https://github.com/eth-p/bat-extras.git && cd bat-extras && ./build.sh
mv ./bin/* ~/.local/bin/

#fd
sudo apt install fd-find
ln -s $(which fdfind) ~/.local/bin/fd

#go
GO_URL="https://golang.org"
GO_ENDPOINT="$(curl -s https://go.dev/dl/ | grep "linux" -n --color |head -1| cut -d "=" -f 3 | cut -d '"' -f 2)"
curl -L0 -s $GO_URL$GO_ENDPOINT -o go.tar.gz
sudo tar -C /usr/local -xvf go.tar.gz
rm go.tar.gz
echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.profile
echo "export PATH=$PATH:$HOME/go/bin" >> ~/.bashrc #Add go install in PATH

#ko
go install github.com/google/ko@latest
