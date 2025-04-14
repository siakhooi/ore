#!/bin/bash
set -e

readonly TARGET=target
readonly SOURCE=src

mkdir "$TARGET"

# Control File
cp -vr $SOURCE/DEBIAN $TARGET

# Binary File
mkdir -p $TARGET/usr/bin
cp -vr $SOURCE/bin $TARGET/usr
chmod 755 $TARGET/usr/bin/*

# Lib File
readonly build_lib_home=$TARGET/usr/lib/ore
mkdir -p "$build_lib_home"
cp -vr $SOURCE/lib/* "$build_lib_home"
chmod 755 "$build_lib_home"/*


fakeroot dpkg-deb --build -Zxz $TARGET
dpkg-name ${TARGET}.deb

DEBFILE=$(ls ./*.deb)

sha256sum "$DEBFILE" >"$DEBFILE.sha256sum"
sha512sum "$DEBFILE" >"$DEBFILE.sha512sum"

dpkg --contents "$DEBFILE"
