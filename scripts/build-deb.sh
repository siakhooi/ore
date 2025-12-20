#!/bin/bash
set -e

readonly TARGET=target
readonly SOURCE=src

mkdir "$TARGET"

# Control File
cp -vr $SOURCE/DEBIAN $TARGET
chmod 755 $TARGET/DEBIAN/postinst
chmod 755 $TARGET/DEBIAN/prerm

# Binary File
mkdir -p $TARGET/usr/bin
find $SOURCE/bin -type f -exec cp -vr {} "$TARGET/usr/bin" \;
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
