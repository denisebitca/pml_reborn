#!/bin/bash

LIST="libbs2b0 libopencore-amrwb0 libopencore-amrnb0 libvo-amrwbenc0 libopenal1 librubberband2 libxpresent1"
MPVLINK="https://non-gnu.uvt.nl/debian/jammy/mpv/mpv_0.35.0+fruit.1_amd64.deb"

mkdir build/mpv
cd build/mpv
apt download $LIST
curl $MPVLINK --output mpv.deb

mkdir lib
mkdir bin

for file in ./*.deb; do
	mkdir tmp
	dpkg-deb --extract $file tmp
	mv tmp/usr/bin/* bin
	mv tmp/usr/lib/x86_64-linux-gnu/* lib
	rm -rf tmp
	rm -rf $file
done

cd ../..
mv build/mpv/lib/* lib
mv build/mpv/bin/* bin
