SUBDIRS = teacher refsheet
VERSION = 2.0.0
BASE = kowalski7cc-backgrounds
NAME =  $(BASE)-$(VERSION)
BUILDDIR=$(shell rpm --eval '%_topdir')

TAR=tar --exclude=.git --exclude=.gitkeep --exclude=dist --exclude=*.tar.xz -hcvzf
RPMBUILD=rpmbuild -D "version $(VERSION)"

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
	$(TAR) $(NAME).tar.xz Attribution Makefile README.md $(SUBDIRS) $(BASE).spec COPYING CC-BY-SA-4.0

clean:
	rm -rf $(NAME).tar.xz

rpm: dist
	$(RPMBUILD) -ta --clean --rmsource $(NAME).tar.xz

deb:
	dpkg-buildpackage -A -rfakeroot

srpm: dist
	$(RPMBUILD) -ts --clean --rmsource $(NAME).tar.xz

.PHONY: all install dist clean rpm