MPV := bin/mpv
XDOTOOL := bin/xdotool
STARTMSG := .startmessage
ENDMSG := .endmessage
STREAMLINK := bin/streamlink
YOUTUBE-DL := bin/youtube-dl
#MPLAYER := bin/mplayer
XDOTOOL_LIB := lib/libxdo.so.3

DLED_BINARIES := $(XDOTOOL) \
			$(STREAMLINK) \
			$(YOUTUBE-DL) \
			$(MPV)
DLED_LIBRARIES := $(XDOTOOL_LIB)
STREAMLINK_RELEASE := https://github.com/streamlink/streamlink-appimage/releases/download/5.1.2-2/streamlink-5.1.2-2-cp311-cp311-manylinux2014_x86_64.AppImage
YOUTUBE-DL_RELEASE := https://yt-dl.org/downloads/latest/youtube-dl

all: $(STARTMSG) $(MPV) $(XDOTOOL) $(STREAMLINK) $(YOUTUBE-DL) $(ENDMSG)

$(STARTMSG):
	@cat startmsg.txt
	@sleep 3
	@touch .startmessage

$(MPV):
	./mpv_build_script.sh
	@echo "-\e[92m\e[1m- MPV DONE --\e[0m"

#$(MPLAYER):
#	git clone git://git.mplayerhq.hu/mplayer build/mplayer
#	(cd build/mplayer && ./configure --enable-openssl-nondistributable --yasm='')
#	make -C build/mplayer -f Makefile
#	mv build/mplayer/mplayer bin
#	@echo "-\e[92m\e[1m- MPLAYER DONE --\e[0m"

$(XDOTOOL):
	git clone https://github.com/jordansissel/xdotool build/xdotool
	make -C build/xdotool
	mv build/xdotool/xdotool bin
	mv build/xdotool/libxdo.so lib/libxdo.so.3
	@echo "-\e[92m\e[1m- XDOTOOL DONE --\e[0m"

$(STREAMLINK):
	curl -L $(STREAMLINK_RELEASE) -o bin/streamlink
	chmod +x bin/streamlink
	@echo "-\e[92m\e[1m- STREAMLINK DONE --\e[0m"

$(YOUTUBE-DL):
	curl -L $(YOUTUBE-DL_RELEASE) -o bin/youtube-dl
	chmod +x bin/youtube-dl
	@echo "-\e[92m\e[1m- YOUTUBE-DL DONE --\e[0m"

$(ENDMSG):
	@cat endmsg.txt
	@touch .endmessage

clean:
	rm -rvf ./build/*
	touch build/.gitkeep

fclean: clean
	rm -vf $(DLED_BINARIES)
	rm -vf ./lib/*
	rm -vf $(STARTMSG)
	rm -vf $(ENDMSG)

re: fclean all

.PHONY: all clean fclean re
