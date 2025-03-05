Name: metrics-chooser
Version: 1.0.0
Release: 1%{?dist}
Summary: Server metrics chooser
License: MIT
URL: https://github.com/fiowro/metrics_chooser
Source0: metrics_chooser.sh
Source1: README.md
Source2: LICENSE
BuildArch: noarch
Requires: gum bash

%description
Metrics Chooser is a simple bash script which asks what data should be collected on the server (e.g., RAM, CPU, free space, etc.).

It uses Gum to create text user interface.

%prep
%setup -T

%build

%install
mkdir -p %{buildroot}/%{_bindir}
mkdir -p %{buildroot}/usr/share/doc
install -m 0755 metrics_chooser.sh %{buildroot}/%{_bindir}/metrics_chooser.sh

%files
%doc README.md LICENSE
%{_bindir}/metrics_chooser.sh

%changelog
* Mon Mar 03 2025 Dmitriy Kostiuk <dmitriykostiuk@gmail.com> - 1.0.0
- First metrics-chooser packaged version
