Name:           siakhooi-ore
Version:        0.2.0
Release:        1%{?dist}
Summary:        certificate generators for development purposes

License:        MIT
URL:            https://github.com/siakhooi/bash-ore
Source0:        https://github.com/siakhooi/%{name}/archive/refs/tags/${version}.tar.gz
BuildArch:      noarch

Requires:       bash

%description
certificate generators for development purposes.

%install
%{__mkdir}   -v -p %{buildroot}%{_bindir}
%{__mkdir}   -v -p %{buildroot}%{_libdir}/ore
%{__mkdir}   -v -p %{buildroot}/usr/share/licenses/siakhooi-ore
%{__install} -v -m 0755 %{_topdir}/BUILD/usr/bin/* %{buildroot}%{_bindir}
%{__install} -v -m 0755 %{_topdir}/BUILD/usr/lib/ore/* %{buildroot}%{_libdir}/ore
%{__install} -v -m 644  %{_topdir}/BUILD/LICENSE %{buildroot}/usr/share/licenses/siakhooi-ore

%files
%license LICENSE
%{_bindir}/ore-config
%{_libdir}/ore/ore-init

%changelog
* Mon Apr 14 2025 Siak Hooi <siakhooi@gmail.com> - 0.2.0
- add ore-init

* Sun Apr 13 2025 Siak Hooi <siakhooi@gmail.com> - 0.1.0
- initial version
