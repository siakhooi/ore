#!/bin/bash
set -e

rm -rf ~/rpmbuild
rpmdev-setuptree

readonly SOURCE=src
readonly TARGET=~/rpmbuild/BUILD/

# Spec File
cp $SOURCE/RPMS/siakhooi-ore.spec ~/rpmbuild/SPECS

# Binary File
mkdir -p $TARGET/usr/bin
cp -vr $SOURCE/bin $TARGET/usr
chmod 755 $TARGET/usr/bin/*

# Lib File
readonly build_lib_home=$TARGET/usr/lib/ore
mkdir -p "$build_lib_home"
cp -vr $SOURCE/lib/* "$build_lib_home"
chmod 755 "$build_lib_home"/*

# License
cp -vf ./LICENSE "$TARGET"

# build rpm file
rpmlint ~/rpmbuild/SPECS/siakhooi-ore.spec
rpmbuild -bb -vv ~/rpmbuild/SPECS/siakhooi-ore.spec
cp -vf ~/rpmbuild/RPMS/noarch/siakhooi-ore-*.rpm .

# query
tree ~/rpmbuild/
rpm -ql ~/rpmbuild/RPMS/noarch/siakhooi-ore-*.rpm

rpm_file=$(basename "$(ls ./siakhooi-ore-*.rpm)")

sha256sum "$rpm_file" >"$rpm_file.sha256sum"
sha512sum "$rpm_file" >"$rpm_file.sha512sum"
