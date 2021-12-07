#!/bin/bash

## Install tools

#docker, vim plugin etc

#xclip
echo "[*] Install clip.."
sudo apt install xclip

#bat & extras
echo "[*] Install bat & co.."
sudo apt install bat
git clone https://github.com/eth-p/bat-extras.git && cd bat-extras && ./build.sh
mv ./bin/* $HOME/.local/bin/

#fd
echo "[*] Install fd.."
sudo apt install fd-find
ln -s $(which fdfind) $HOME/.local/bin/fd

#go
echo "[*] Install go.."
GO_URL="https://golang.org"
GO_ENDPOINT="$(curl -s https://go.dev/dl/ | grep "linux" -n --color |head -1| cut -d "=" -f 3 | cut -d '"' -f 2)"
curl -L0 -s $GO_URL$GO_ENDPOINT -o go.tar.gz
sudo tar -C /usr/local -xvf go.tar.gz
rm go.tar.gz
echo "export PATH=$PATH:/usr/local/go/bin" >> $HOME/.profile
echo "export PATH=$PATH:$HOME/go/bin" >> $HOME/.zshrc #Add go install in PATH

#ko
echo "[*] Install ko.."
go install github.com/google/ko@latest

#ngrok
echo "[*] Install ngrok.."
wget --no-check-certificate https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
unzip ngrok-stable-linux-amd64.zip
mv ./ngrok $HOME/.local/bin/
echo "[INPUT REQUIRE] Enter your ngrok token: (find it https://dashboard.ngrok.com/get-started/your-authtoken)"
read -s NGROK_TOKEN
$HOME/.local/bin/ngrok authtoken $NGROK_TOKEN
unset NGROK_TOKEN

echo "export PATH=$PATH:$HOME/.local/bin/" >> $HOME/.zshrc
