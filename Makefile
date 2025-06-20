help:
clean:
	rm -rf target *.deb *.sha256sum *.sha512sum *.rpm ~/rpmbuild
build-deb: clean
	./scripts/shellcheck.sh
	./scripts/build-deb.sh
build-rpm: clean
	./scripts/shellcheck.sh
	scripts/build-rpms.sh
set-version:
	scripts/set-version.sh
git-commit-and-push:
	scripts/git-commit-and-push.sh
create-release:
	scripts/create-release.sh
all-deb: clean set-version build-deb
all-rpm: clean set-version build-rpm

deb-install:
	apt install ./*.deb
deb-uninstall:
	apt remove -y siakhooi-ore
rpm-install:
	rpm -i ./*.rpm
rpm-uninstall:
	rpm -e siakhooi-ore

deb-depends:
	scripts/find-deb-depends.sh
yum-depends:
	scripts/find-yum-depends.sh

check-init:
	ls -l /etc/profile.d/ore-init.sh /usr/lib/ore/ore-init
