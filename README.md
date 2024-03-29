# 💥

## TL;DR

**⛳ When you want to load all shortcuts within shell just tap `bang`**

Update installation script & shortcut with: `bang.conf.update`

## Quickstart
**➲** *Let your environment be ready*
```shell
# prerequisites
git clone https://github.com/ariary/bang.git && cd bang && ./prerequisite.sh
# zsh theme
./install/configure-zsh.sh
# load bang shortcut
export SH=zsh && echo "export PATH=$PATH:$HOME/.local/bin/" >> ~/.${SH}rc && echo "source ~/.bang/bang_conf" >> ~/.${SH}rc && echo "source ~/.bang/install/.aliases" >> ~/.${SH}rc && source ~/.${SH}rc
```

*(Alternatively, if you want to automaticaly have them in every shell, add `source ~/.bang/bang` in your ~/.${SH}rc)*


*(We assume that you have already install `zsh`, otherwise replace `SH` envvar by `bash`)*

You can now install tools needed by bang shortcuts!

## Install tools
**➲** *Ease tools installation*
* ***`bang.conf.install-ariary`***: install all ariary tools useful for pentesting in ~/.local/bin/
* ***`bang.conf.install`***: install other useful tools for pentesting in ~/.local/bin/

These tools are used in bang shortcuts then.

*To update the installation scripts used by these commands: `bang.conf.update`*

1. `bang.conf.install.include golang docker`
2. `bang.conf.install-ariary`
3. `bang.conf.install.exclude golang docker`

## Bang !
**➲** *Configure your pentest*

**⛳ When you want to load all shortcuts within shell just tap `bang`**

Set attacker and target info: `bang.conf.pentest`

You could alternatively configure each item:
 * attacker addr: `cAA=[ATTACKER_IP]` & attacker port: `cAP=[ATTACKER_PORT]` 
 * target addr: `cTA=[TARGET_IP]` & target port: `cTP=[TARGET_PORT]`

*You could see the pentest configuration then with `bang.conf.pentest.map`*

## Shortcut Examples
**➲** *List of useful `bang` shortcuts*

List all shortcut with `bang.ls`

#### `gitar` (pentest easy file sharing)

* [Share file with remote machine](https://github.com/ariary/bang/blob/main/EXAMPLES.md#share-files)
* [Share file with remote machine safely](https://github.com/ariary/bang/blob/main/EXAMPLES.md#share-files-safely)
* [Expose local file on internet (`ngrok`)](https://github.com/ariary/bang/blob/main/EXAMPLES.md#expose-local-file-on-internet) (Attacker ⇠ Internet ⇠ Target)


#### `fileless-xec` (stealth execution of binary on a remote machine)

* [Exec local binary exposing it trough http](https://github.com/ariary/bang/blob/main/EXAMPLES.md#exec-binary-from-a-local-http-server) (Attacker ⇠ Target)
* [Copy line to run `fileless-xec` on remote](https://github.com/ariary/bang/blob/main/EXAMPLES.md#copy-line-to-launch-fieleless-xec-stealth-dropper)
* [Send local binary on remote & execute it using `fileless-xec`](https://github.com/ariary/bang/blob/main/EXAMPLES.md#send-a-local-file-to-remote-fileless-xec-to-stealthy-run-it) (Attacker ⇢ Target)

#### `Queensono`( Use ICMP protocol for data exchange)

* Send trough ICMP
  * [File](https://github.com/ariary/bang/blob/main/EXAMPLES.md#send-a-file-trough-icmp)
    * [Copy line to send file](https://github.com/ariary/bang/blob/main/EXAMPLES.md#copy-the-line-to-send-a-file)
  * [Message](https://github.com/ariary/bang/blob/main/EXAMPLES.md#send-a-message-trough-icmp)
    * [Copy line to send message](https://github.com/ariary/bang/blob/main/EXAMPLES.md#copy-the-line-to-send-a-message)
* Receive trough ICMP
  * [File](https://github.com/ariary/bang/blob/main/EXAMPLES.md#copy-the-line-to-send-a-message)
    * [Copy line to receive file](https://github.com/ariary/bang/blob/main/EXAMPLES.md#copy-the-line-to-send-a-message)
  * [Message](https://github.com/ariary/bang/blob/main/EXAMPLES.md#copy-the-line-to-send-a-message)
    * [Copy line to receive message](https://github.com/ariary/bang/blob/main/EXAMPLES.md#copy-the-line-to-send-a-message)

#### `jse`( Extract js code from HTML page)
* [Extract js code for html page from curl](https://github.com/ariary/bang/blob/main/EXAMPLES.md#jse)
* [Find DOM XSS](https://github.com/ariary/bang/blob/main/EXAMPLES.md#find-dom-xss) with [`fsource`](https://github.com/ariary/DomXssFinder) and [`fsink`](https://github.com/ariary/DomXssFinder)

#### [`httpcustomhouse`](https://github.com/ariary/HTTPCustomHouse#usage)

* Search for HTTP request smuggling with [`httpecho`](https://github.com/ariary/httpecho)

#### [`console.sh`](https://github.com/ariary/console.sh)

* Execute shell commands from browser JS console 


#### [`cfuzz`](https://github.com/ariary/cfuzz)

* Fuzz command line

#### Others

* [Persistence on target (even in internal network!)](https://github.com/ariary/bang/blob/main/EXAMPLES.md#persistence)
  * [Reverse shell](https://github.com/ariary/bang/blob/main/EXAMPLES.md#via-a-tcp-tunnel)
  * [Webshell](https://github.com/ariary/bang/blob/main/EXAMPLES.md#via-webshell)
* [Start a webdav server](https://github.com/ariary/bang/blob/main/EXAMPLES.md#webdav-server)
* [Intercept HTTP request from command line](https://github.com/ariary/bang/blob/main/EXAMPLES.md#intercept-request-with-command-line)
* [Perform `nmap` scan](https://github.com/ariary/bang/blob/main/EXAMPLES.md#nmap-scan)
* [Perform web indexing](bang.feroxbuster.search-extensions)
* [Deploy local app with trusted cert](https://github.com/ariary/bang/blob/main/EXAMPLES.md#deploy-local-app-with-trusted-cert)
* [Launch a bomb within current directory](https://github.com/ariary/bang/blob/main/EXAMPLES.md#launch-a-bomb-inside-your-tty)
* [Copy a line to exit vim](https://github.com/ariary/bang/blob/main/EXAMPLES.md#exit-vim-line)
* [Launch background process](https://github.com/ariary/bang/blob/main/EXAMPLES.md#use-screen-to-launch-process-in-background)
* [Get weather for a given city](https://github.com/ariary/bang/blob/main/EXAMPLES.md#get-the-weather-of-your-city)
* [`bang` helpers](https://github.com/ariary/bang/blob/main/EXAMPLES.md#bang-helpers)
