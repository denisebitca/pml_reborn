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

pml\_reborn is a set of Bash scripts for displaying videos and images over the lockscreen based on mplayer, meant for Dell machines on the 42 Paris campus.

Macs are currently unsupported - help is appreciated in order to get it working.

## Credits

This work is based on some of [Jérémy M.'s work](https://github.com/jerem-ma/pimp_my_lock) - which is under the MIT License. Thanks Jérémy!

No code or binaries from [mplayer](http://www.mplayerhq.hu), [streamlink](https://streamlink.github.io/), [xdotool](https://github.com/jordansissel/xdotool) or [youtube-dl](https://github.com/ytdl-org/youtube-dl) are packaged with pml_reborn, but these tools are referenced in the code.

## License

This work is licensed under the GPLv3 license. A copy of it is in the file LICENSE.

## Installation

A Makefile is included to install all the binaries necessary for pml_reborn to work. In order to download and install everything, run ``make``.

**Attention:** The mplayer configuration script will prompt you to press Enter at the start of compilation. You will have to press Enter.

**Warning:** It will take a bit. *I don't even want to imagine compiling this on Mac...*

Help is appreciated to add flags to mplayer's compilation process so that compilation gets faster (removing audio support, DVD support...)

## Configuration

TODO