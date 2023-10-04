WP_PACKAGE=kowalski7cc
WP_NAME=teacher
WP_DIR=$(DESTDIR)/usr/share/backgrounds/$(WP_PACKAGE)
GNOME_BG_DIR=$(DESTDIR)/usr/share/gnome-background-properties
MKDIR=/bin/mkdir -p
INSTALL=/usr/bin/install -p -m644 -D
LN_S=/bin/ln -s<
CP=/bin/cp -p

all:

build:
	for tod in day night; do \
	  rsvg-convert -w 3840 -h 3840 -o $(WP_NAME)-$${tod}.png $(WP_NAME)-$${tod}.svg; \
	done;

install:
	$(MKDIR) $(WP_DIR)/$(WP_NAME)
	$(INSTALL) $(WP_NAME).xml $(WP_DIR)/$(WP_NAME)/$(WP_NAME).xml
	#~ Base background
	for tod in day night; do \
	  $(INSTALL) $(WP_NAME)-$${tod}.png $(WP_DIR)/$(WP_NAME)/$(WP_NAME)-$${tod}.png ; \
	done;
	
	#~ GNOME background
	$(MKDIR) $(GNOME_BG_DIR)
	$(INSTALL) gnome-backgrounds-$(WP_NAME).xml $(GNOME_BG_DIR)/$(WP_PACKAGE)-$(WP_NAME).xml