%global Bg_Name kowalski7cc
%global bgname %(t="%{Bg_Name}";echo ${t,,})

Name:           %{bgname}-backgrounds
Version:        1.0.0
Release:        %autorelease
Summary:        Kowalski Dragon default desktop background

License:        CC-BY-SA-4.0
Source0:        %{name}-%{version}.tar.xz
BuildArch:      noarch

%description
This package contains desktop backgrounds for the Kowalski Dragon default
theme. Pulls in themes for GNOME desktop.



%prep
%autosetup -n %{name}-%{version}


%build
%make_build


%install
%make_install

%changelog
%autochangelog

%files
%license COPYING Attribution
%dir %{_datadir}/backgrounds/%{bgname}
%dir %{_datadir}/backgrounds/%{bgname}/default
%{_datadir}/backgrounds/%{bgname}/default/%{bgname}*.{webp,xml}
%{_datadir}/gnome-background-properties/%{bgname}.xml
%dir %{_datadir}/gnome-background-properties/
