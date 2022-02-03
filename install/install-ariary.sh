#!/bin/bash
export BLUE='\033[0;34m'
export NC='\033[0m'
## Install and update ariary repo
## put ~/.local/bin/ in your $PATH (export $PATH=$PATH:$HOME/.local/bin/)

### Queensono
echo -e "${BLUE}[*] Install Queensono..${NC}"
curl -s -lO -L https://github.com/ariary/QueenSono/releases/latest/download/qsreceiver
curl -s -lO -L https://github.com/ariary/QueenSono/releases/latest/download/qssender
chmod +x qsreceiver qssender
mv qsreceiver $HOME/.local/bin/ && mv qssender $HOME/.local/bin/


### Fileless-xec
echo -e "${BLUE}[*] Install fileless-xec..${NC}"
curl -s -lO -L https://github.com/ariary/fileless-xec/releases/latest/download/fileless-xec
chmod +x fileless-xec
mv fileless-xec $HOME/.local/bin/


### Gitar
echo -e "${BLUE}[*] Install gitar..${NC}"
curl -s -lO -L https://github.com/ariary/gitar/releases/latest/download/gitar
chmod +x gitar
mv gitar $HOME/.local/bin/
git clone https://github.com/ariary/gitar.git && cd gitar
make build.image-gitar
cd .. && rm -rf gitar


### jse
echo -e "${BLUE}[*] Install jse..${NC}"
curl -lO -L -s https://github.com/ariary/JSextractor/releases/latest/download/jse
chmod +x jse
mv jse $HOME/.local/bin/

### DomXssFinder
echo -e "${BLUE}[*] Install DomXssFinder (fsource and fsink)..${NC}"
curl -s -lO -L https://github.com/ariary/DomXssFinder/releases/latest/download/fsink 
curl -s -lO -L https://github.com/ariary/DomXssFinder/releases/latest/download/fsource
chmod +x fsink fsource
mv fsink $HOME/.local/bin/ && mv fsource $HOME/.local/bin/

### httpecho
echo -e "${BLUE}[*] Install httpecho..${NC}"
curl -lO -L -s https://github.com/ariary/httpecho/releases/latest/download/httpecho
chmod +x httpecho
mv httpecho $HOME/.local/bin/

### httpcustomhouse
echo -e "${BLUE}[*] Install httpcustomhouse..${NC}"
curl -lO -L -s https://github.com/ariary/HTTPCustomHouse/releases/latest/download/httpcustomhouse && chmod +x httpcustomhouse
chmod +x httpcustomhouse
mv httpcustomhouse $HOME/.local/bin/

### console.sh
echo -e "${BLUE}[*] Install console.sh..${NC}"
curl -lO -L -s https://github.com/ariary/console.sh/releases/latest/download/console.sh
chmod +x console.sh
mv console.sh $HOME/.local/bin/
