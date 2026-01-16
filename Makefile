SUBDIRS = teacher refsheet packaging
BASE = kowalski7cc-backgrounds
VERSION = 5.0.0-1
NAME = $(BASE)-$(VERSION)
TAR=tar --exclude-vcs --exclude-vcs-ignores --exclude-backups -hcvzf
RPMBUILD=rpmbuild
DEBIAN_FILES=debian/control debian/changelog debian/rules debian/copyright
MAGICK_WINDOWS_CROP = -gravity center -crop 16:9 +repage

all:
	for i in $(SUBDIRS) ; do \
		(cd $$i; $(MAKE)) ;\
	done;
	
install:
	for i in $(SUBDIRS) ; do \
		(cd $$i; $(MAKE) install) ; \
	done;

dist:
	[ -f $(NAME).tar.xz ] && rm $(NAME).tar.xz || true
	@mkdir -p dist
	$(TAR) dist/$(NAME).tar.xz .

clean:
	for i in $(SUBDIRS) ; do \
		(cd $$i; $(MAKE) clean) ; \
	done;
	rm -rf $(NAME).tar.xz

rpm:
	@mkdir -p dist
	$(RPMBUILD) -bb --build-in-place -D "_rpmdir ${PWD}/dist" ${BASE}.spec

deb:
	dpkg-buildpackage -A -rfakeroot

srpm: dist
	$(RPMBUILD) -ts --clean --rmsource dist/$(NAME)-$(VERSION).tar.xz

deskthemepack:
	@mkdir -p theme/DesktopBackground
	for i in $(SUBDIRS) ; do \
	    if [ ! -f $$i/$$i.theme ] ; then \
	        continue ; \
	    fi ; \
		if [ -f $$i/$$i-day.png ] ; then \
		    magick $$i/$$i-day.png $(MAGICK_WINDOWS_CROP) theme/DesktopBackground/$$i.jpg ;\
		else \
		    magick $$i/$$i.png $(MAGICK_WINDOWS_CROP) theme/DesktopBackground/$$i.jpg ;\
		fi ; \
		cp $$i/$$i.theme theme/ ;\
		(cd theme && gcab -c -z $(BASE)-$$i.deskthemepack DesktopBackground/$$i.jpg $$i.theme) ;\
	done;

.PHONY: all build install dist clean rpm deskthemepack