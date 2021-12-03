# 💥

## Pre-requisites

* `git clone https://github.com/ariary/bang.git && cd bang && ./prerequisite.sh`
* `echo "export $PATH=$PATH:$HOME/bin" >> ~/.bashrc && source ~/.bashrc`
* `echo "source ~/.bang_conf" >> ~/.bashrc && source ~/.bashrc`

## Install tools
**➲** *Install all sort of tools*
* ***install-ariary.sh***: install all ariary useful (for pentesting) repo in ~/bin
* ***install-tools.sh***: install other useful tools for pentesting

## Bang !
**➲** *Load shortcuts and aliases*
1. Configure your pentest (Set attacker and target info):
    * attacker addr: `cAA=[ATTACKER_IP]` & attacker port: `cAP=[ATTACKER_PORT]` 
    * target addr: `cTA=[ATTACKER_IP]` & target port: `cTP=[ATTACKER_PORT]`

2. Load Shortcuts: `$ bang`

### Gitar example

Start file sharing:
```
bang.gitar $AA $AP
```
