#!/bin/bash

YOUTUBE_DL=$(curl -s https://api.github.com/repos/ytdl-patched/youtube-dl/releases/latest | grep -e "browser_download_url.*youtube-dl\"$" | cut -d : -f 2,3 | tr -d \" | xargs)

echo "$YOUTUBE_DL"

curl -L "$YOUTUBE_DL" -o bin/youtube-dl
chmod +x ./bin/youtube-dl
