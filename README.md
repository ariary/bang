# 💥

## Quickstart
**➲** *Let your environment be ready*
* `git clone https://github.com/ariary/bang.git && cd bang && ./prerequisite.sh`
* `export SH=[bash/zsh] && echo "export PATH=$PATH:$HOME/.local/bin/" >> ~/.$SHrc && source ~/.$SHrc`
* `export SH=[bash/zsh] && echo "source ~/.bang/bang_conf" >> ~/.$SHrc && source ~/.$SHrc`

## Install tools
**➲** *Install all sort of tools*
* ***install-ariary.sh***: install all ariary useful (for pentesting) repo in ~/.local/bin/
* ***install-tools.sh***: install other useful tools for pentesting in ~/.local/bin/

## Bang !
**➲** *Configure your pentest*

Set attacker and target info: `bang.conf`

You could alternatively configure each item:
 * attacker addr: `cAA=[ATTACKER_IP]` & attacker port: `cAP=[ATTACKER_PORT]` 
 * target addr: `cTA=[TARGET_IP]` & target port: `cTP=[TARGET_PORT]`


## Examples
**➲** *List of useful `bang` shortcuts*

#### `gitar` (pentest easy file sharing)

* [Share file with remote machine](https://github.com/ariary/bang/blob/main/EXAMPLES.md#share-files)
* [Share file with remote machine safely](https://github.com/ariary/bang/blob/main/EXAMPLES.md#share-files-safely)
* [Expose local file on internet (`ngrok`)](https://github.com/ariary/bang/blob/main/EXAMPLES.md#expose-local-file-on-internet)


#### `fileless-xec` (stealth execution of binary on a remote machine)

* [Exec local binary exposing it trough http](https://github.com/ariary/bang/blob/main/EXAMPLES.md#exec-binary-from-a-local-http-server)
* [Copy line to run `fileless-xec` on remote](https://github.com/ariary/bang/blob/main/EXAMPLES.md#copy-line-to-launch-fieleless-xec-stealth-dropper)
* [Send local binary on remote & execute it using `fileless-xec`](https://github.com/ariary/bang/blob/main/EXAMPLES.md#send-a-local-file-to-remote-fileless-xec-to-stealthy-run-it)


#### Others

* [Start a webdav server](https://github.com/ariary/bang/blob/main/EXAMPLES.md#webdav-server)
