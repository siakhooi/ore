Name:           siakhooi-ore
Version:        0.6.0
Release:        1%{?dist}
Summary:        certificate generators for development purposes

License:        MIT
URL:            https://github.com/siakhooi/bash-ore
Source0:        https://github.com/siakhooi/%{name}/archive/refs/tags/${version}.tar.gz
BuildArch:      noarch

Requires:       bash, coreutils, siakhooi-devutils-echo-colors, siakhooi-textutils, util-linux, sed, findutils

%description
certificate generators for development purposes.

%install
%{__mkdir}   -v -p %{buildroot}%{_bindir}
%{__mkdir}   -v -p %{buildroot}%{_libdir}/ore
%{__mkdir}   -v -p %{buildroot}/usr/share/ore/samples
%{__mkdir}   -v -p %{buildroot}/usr/share/ore/schemas
%{__mkdir}   -v -p %{buildroot}/usr/share/licenses/siakhooi-ore
%{__install} -v -m 0755 %{_topdir}/BUILD/usr/bin/* %{buildroot}%{_bindir}
%{__install} -v -m 0755 %{_topdir}/BUILD/usr/lib/ore/* %{buildroot}%{_libdir}/ore
%{__install} -v -m 644  %{_topdir}/BUILD/usr/share/ore/samples/* %{buildroot}/usr/share/ore/samples
%{__install} -v -m 644  %{_topdir}/BUILD/usr/share/ore/schemas/* %{buildroot}/usr/share/ore/schemas
%{__install} -v -m 644  %{_topdir}/BUILD/LICENSE                 %{buildroot}/usr/share/licenses/siakhooi-ore

%post
ln -sf /usr/lib/ore/ore-init /etc/profile.d/ore-init.sh

%preun
if [ "$1" -eq 0 ]; then
    [ -L /etc/profile.d/ore-init.sh ] && rm -f /etc/profile.d/ore-init.sh
fi

%files
%license LICENSE
%{_bindir}/ore-config
%{_bindir}/ore-config-edit
%{_bindir}/ore-config-set
%{_bindir}/ore-config-artifacts-sample
%{_bindir}/ore-config-artifacts-validate
%{_libdir}/ore/ore-init
/usr/share/ore/samples/ore-config-artifacts.yaml
/usr/share/ore/schemas/ore-config-artifacts.yaml

%changelog
* Fri Jun 20 2025 Siak Hooi <siakhooi@gmail.com> - 0.6.0
- add init to /etc/profile.d

* Tue Apr 29 2025 Siak Hooi <siakhooi@gmail.com> - 0.5.0
- add ore-config-artifacts-validate

* Wed Apr 16 2025 Siak Hooi <siakhooi@gmail.com> - 0.4.0
- add ore-config-artifacts-sample

* Tue Apr 15 2025 Siak Hooi <siakhooi@gmail.com> - 0.3.0
- add ore-config-{edit,set}

* Mon Apr 14 2025 Siak Hooi <siakhooi@gmail.com> - 0.2.0
- add ore-init

* Sun Apr 13 2025 Siak Hooi <siakhooi@gmail.com> - 0.1.0
- initial version
