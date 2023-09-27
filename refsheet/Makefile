WP_PACKAGE=kowalski7cc
WP_NAME=refsheet
WP_DIR=$(DESTDIR)/usr/share/backgrounds/$(WP_PACKAGE)
GNOME_BG_DIR=$(DESTDIR)/usr/share/gnome-background-properties
MKDIR=/bin/mkdir -p
INSTALL=/usr/bin/install -p -m644 -D
LN_S=/bin/ln -s<
CP=/bin/cp -p

all:

install:
	$(MKDIR) $(WP_DIR)/$(WP_NAME)
	#~ Base background
	$(INSTALL) $(WP_NAME).webp $(WP_DIR)/$(WP_NAME)/$(WP_NAME).webp ;
	
	#~ GNOME background
	$(MKDIR) $(GNOME_BG_DIR)
	$(INSTALL) gnome-backgrounds-$(WP_NAME).xml $(GNOME_BG_DIR)/$(WP_PACKAGE)-$(WP_NAME).xml