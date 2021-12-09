#!/bin/bash

##zsh & co
echo "[*] Install ZSH & co.."
sudo apt install zsh
sudo apt install zsh-completions
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

