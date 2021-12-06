# 💥

## Quickstart
**➲** *Let your environment be ready*
* `git clone https://github.com/ariary/bang.git && cd bang && ./prerequisite.sh`
* `echo "export PATH=$PATH:$HOME/.local/bin/" >> ~/.bashrc && source ~/.bashrc`
* `echo "source ~/.bang/bang_conf" >> ~/.bashrc && source ~/.bashrc`

## Install tools
**➲** *Install all sort of tools*
* ***install-ariary.sh***: install all ariary useful (for pentesting) repo in ~/.local/bin/
* ***install-tools.sh***: install other useful tools for pentesting in ~/.local/bin/

## Bang !
**➲** *Load shortcuts and aliases*
1. Configure your pentest (Set attacker and target info): `bang.conf`

You could alternatively configure each item:
 * attacker addr: `cAA=[ATTACKER_IP]` & attacker port: `cAP=[ATTACKER_PORT]` 
 * target addr: `cTA=[TARGET_IP]` & target port: `cTP=[TARGET_PORT]`

2. Load Shortcuts: `bang`

### Examples

#### `gitar` (pentest easy file sharing)

* share file with remote machine
* share file with remote machine safely

#### `fileless-xec` (stealth execution of binary on a remote machine)

* Copy line to run `fileless-xec` on remote
* Send local binary on remote & execute it using `fileless-xec`