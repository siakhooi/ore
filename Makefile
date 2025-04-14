help:
clean:
	rm -rf target *.deb *.sha256sum *.sha512sum *.rpm ~/rpmbuild
build-deb: clean
	./scripts/build-deb.sh
build-rpm: clean
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
	apt remove siakhooi-ore
rpm-install:
	rpm -i ./*.rpm
rpm-uninstall:
	rpm -e siakhooi-ore
