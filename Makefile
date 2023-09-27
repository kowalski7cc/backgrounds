SUBDIRS = default
VERSION = 1.0.1
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
	$(TAR) $(NAME).tar.xz *

clean:
	rm -rf $(NAME).tar.xz

rpm: dist
	$(RPMBUILD) -ta --clean --rmsource $(NAME).tar.xz

srpm: dist
	$(RPMBUILD) -ts --clean --rmsource $(NAME).tar.xz

.PHONY: all install dist clean rpm