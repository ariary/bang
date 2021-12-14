#!/bin/bash

export BLUE='\033[0;34m'
export NC='\033[0m'

##zsh & co
echo -e "${BLUE}[*] Install ZSH & co..${NC}"
sudo apt install zsh
sudo apt install zsh-completions
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
