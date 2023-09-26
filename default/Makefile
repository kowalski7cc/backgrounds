WP_NAME=kowalski7cc
WP_DIR=$(DESTDIR)/usr/share/backgrounds/$(WP_NAME)
WP_DIR_LN=/usr/share/backgrounds/$(WP_NAME)
GNOME_BG_DIR=$(DESTDIR)/usr/share/gnome-background-properties
MKDIR=/bin/mkdir -p
INSTALL=/usr/bin/install -p -m644 -D
LN_S=/bin/ln -s<
CP=/bin/cp -p

all:

install:
	$(MKDIR) $(WP_DIR)/default
	$(INSTALL) $(WP_NAME).xml	$(WP_DIR)/default/$(WP_NAME).xml
	#~ Base background
	for tod in day night; do \
	  $(INSTALL) $(WP_NAME)-$${tod}.webp	$(WP_DIR)/default/$(WP_NAME)-$${tod}.webp ; \
	done;
	
	#~ GNOME background
	$(MKDIR) $(GNOME_BG_DIR)
	$(INSTALL) gnome-backgrounds-$(WP_NAME).xml	$(GNOME_BG_DIR)/$(WP_NAME).xml