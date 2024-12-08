%global Bg_Name kowalski7cc
%global bgname %(t="%{Bg_Name}";echo ${t,,})

Name:           %{bgname}-backgrounds
Version:        5.1.1
Release:        1
Summary:        Kowalski Dragon desktop backgrounds

License:        CC-BY-SA-4.0
Source0:        %{name}-%{version}-%{release}.tar.xz
BuildArch:      noarch
BuildRequires:  librsvg2-tools

%description
This package contains desktop backgrounds for the Kowalski Dragon
theme. Pulls in themes for GNOME desktop.

%prep
%setup -q -c -n %{name}-%{version}

%build
%make_build

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
%{_datadir}/wallpapers/%{Bg_Name}_background_*/
%dir %{_datadir}/xfce4/
%dir %{_datadir}/xfce4/backdrops/
%{_datadir}/xfce4/backdrops/%{Bg_Name}_background_*.png