# 💥

## Pre-requisites

* `~/bin` & `~/.bang` and `~/.bang_conf` (./prerequisite.sh)
* `export $PATH=$PATH:$HOME/bin` (put into `.bashrc`)
* `source ~/.bang_conf` (put into `.bashrc`)

## Install

* ***install-ariary.sh***: install all ariary useful (for pentesting) repo in ~/bin
* ***install-tools.sh***: install other useful tools for pentesting

## Bang !

1. Configure your pentest (Set attacker and target info):
    * attacker addr: `cAA=[ATTACKER_IP]` & attacker port: `cAP=[ATTACKER_PORT]` 
    * target addr: `cTA=[ATTACKER_IP]` & target port: `cTP=[ATTACKER_PORT]`

2. Load Shortcuts: `$ bang`

### Gitar example

Start file sharing:
```
bang.gitar $AA $AP
```