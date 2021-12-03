#!/bin/bash
 
## Install and update ariary repo
## put ~/bin in your $PATH (export $PATH=$PATH:$HOME/bin

### Queensono
echo "[*] Install Queensono.."
curl -s -lO -L https://github.com/ariary/QueenSono/releases/latest/download/qsreceiver
curl -s -lO -L https://github.com/ariary/QueenSono/releases/latest/download/qssender
chmod +x qsreceiver qssender
mv qsreceiver $HOME/bin && mv qssender $HOME/bin


### Fileless-xec
echo "[*] Install fileless-xec.."
curl -s -lO -L https://github.com/ariary/fileless-xec/releases/latest/download/fileless-xec
chmod +x fileless-xec
mv fileless-xec $HOME/bin


### Gitar
echo "[*] Install gitar.."
curl -s -lO -L https://github.com/ariary/gitar/releases/latest/download/gitar
chmod +x gitar
mv gitar $HOME/bin