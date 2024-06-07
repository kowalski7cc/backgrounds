SUBDIRS = teacher refsheet
BASE = kowalski7cc-backgrounds
VERSION = 4.2.0-1
NAME = $(BASE)-$(VERSION)
TAR=tar --exclude-vcs --exclude-vcs-ignores --exclude-backups -hcvzf
RPMBUILD=rpmbuild
DEBIAN_FILES=debian/control debian/changelog debian/rules debian/copyright

all:
	@for i in $(SUBDIRS) ; do \
		(cd $$i; $(MAKE)) ;\
	done;
	
install:
	@for i in $(SUBDIRS) ; do \
		(cd $$i; $(MAKE) install) ; \
	done;

dist:
	[ -f $(NAME).tar.xz ] && rm $(NAME).tar.xz || true
	@mkdir -p dist
	$(TAR) dist/$(NAME).tar.xz .

clean:
	@for i in $(SUBDIRS) ; do \
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

.PHONY: all build install dist clean rpm