SUBDIRS = default
VERSION = 1.0.0
BASE = kowalski7cc-backgrounds
NAME =  $(BASE)-$(VERSION)

all:
	@for i in $(SUBDIRS) ; do \
		(cd $$i; $(MAKE)) ;\
	done;

install:
	@for i in $(SUBDIRS) ; do \
		(cd $$i; $(MAKE) install) ; \
	done;

dist:
	mkdir -p $(NAME)
	cp -a CC-BY-SA-4.0 $(NAME)
	cp -a Attribution $(NAME)
	cp -a Makefile $(NAME)
	cp -a COPYING $(NAME)
	cp -a default $(NAME)
	tar -c --xz -f $(NAME).tar.xz $(NAME)
	rm -rf $(NAME)

clean:
	@for i in $(SUBDIRS) ; do \
		(cd $$i; $(MAKE) clean) ; \
	done;

rpm:
	# run dist, then rpmbuild
	$(MAKE) dist
	rpmbuild -ba $(BASE).spec --define "_sourcedir $(pwd)"

.PHONY: all install dist clean rpm