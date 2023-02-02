```
  _____    __  __   _                 _____    ______   ____     ____    _____    _   _ 
 |  __ \  |  \/  | | |               |  __ \  |  ____| |  _ \   / __ \  |  __ \  | \ | |
 | |__) | | \  / | | |               | |__) | | |__    | |_) | | |  | | | |__) | |  \| |
 |  ___/  | |\/| | | |               |  _  /  |  __|   |  _ <  | |  | | |  _  /  | . ` |
 | |      | |  | | | |____           | | \ \  | |____  | |_) | | |__| | | | \ \  | |\  |
 |_|      |_|  |_| |______|          |_|  \_\ |______| |____/   \____/  |_|  \_\ |_| \_|
                             ______                                                     
                            |______|                                                    
```

pml\_reborn is a set of Bash scripts for displaying videos and images over the lockscreen based on mpv, meant for Dell machines on the 42 Paris campus.

Macs are currently unsupported - help is appreciated in order to get it working.

## Credits

This work is based on some of [Jérémy M.'s work](https://github.com/jerem-ma/pimp_my_lock) - which is under the MIT License. Thanks Jérémy!

No code or binaries from [mpv](http://mpv.io), [streamlink](https://streamlink.github.io/), [xdotool](https://github.com/jordansissel/xdotool) or [youtube-dl](https://github.com/ytdl-org/youtube-dl) are packaged with pml_reborn, but these tools are referenced in the code.

## License

This work is licensed under the GPLv3 license. A copy of it is in the file LICENSE.

## Installation

A Makefile is included to compile/download all the binaries necessary for pml_reborn to work. In order to download and setup everything, run ``make``.

## Configuration

Edit mpv.conf to change the placement of the video. Read more about MPV configuration files in [here](https://github.com/mpv-player/mpv/blob/master/etc/mpv.conf). By default, the video will take up the whole screen.

Run ``./lockscreen true`` to lock the screen and ``./lockscreen false`` to run the video player, but not lock the screen.

By default, the lockscreen uses a websocket server that allows you to change your videos on the fly as the program is running.

Setup https://github.com/denisebitca/pml_reborn_wss if you want this to work. You will have to put your websocket server's domain in the file ``./domain``, with the following format:

```
wss://[domain]:[port]
```

Your websocket server needs to be accessible to the Internet.

Edit ``./lockscreen`` if you do not wish to use a websocket server - comments are present to show you what you need to remove in order to use it without a websocket server.
