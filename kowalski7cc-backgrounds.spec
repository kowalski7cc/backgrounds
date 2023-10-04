%global Bg_Name kowalski7cc
%global bgname %(t="%{Bg_Name}";echo ${t,,})

Name:           %{bgname}-backgrounds
Version:        %{version}
Release:        %autorelease
Summary:        Kowalski Dragon desktop backgrounds

License:        CC-BY-SA-4.0
Source0:        %{name}-%{version}.tar.xz
BuildArch:      noarch

%description
This package contains desktop backgrounds for the Kowalski Dragon
theme. Pulls in themes for GNOME desktop.

%prep
%setup -q -c -n %{name}-%{version}

%build
%make_build
make build %{?_smp_mflags}

%install
%make_install

%changelog
%autochangelog

%files
%license COPYING Attribution
%dir %{_datadir}/backgrounds/%{bgname}
%{_datadir}/backgrounds/%{bgname}/*
%dir %{_datadir}/gnome-background-properties/
%{_datadir}/gnome-background-properties/%{bgname}-*.xml
