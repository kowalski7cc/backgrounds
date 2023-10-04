WP_PACKAGE=kowalski7cc
WP_NAME=refsheet
WP_DIR=$(DESTDIR)/usr/share/backgrounds/$(WP_PACKAGE)
GNOME_BG_DIR=$(DESTDIR)/usr/share/gnome-background-properties
MKDIR=/bin/mkdir -p
INSTALL=/usr/bin/install -p -m644 -D
LN_S=/bin/ln -s<
CP=/bin/cp -p

all:

build:
	rsvg-convert -w 3840 -h 3840 -o $(WP_NAME).png $(WP_NAME).svg;

install:
	$(MKDIR) $(WP_DIR)/$(WP_NAME)
	#~ Base background
	$(INSTALL) $(WP_NAME).png $(WP_DIR)/$(WP_NAME)/$(WP_NAME).png ;
	
	#~ GNOME background
	$(MKDIR) $(GNOME_BG_DIR)
	$(INSTALL) gnome-backgrounds-$(WP_NAME).xml $(GNOME_BG_DIR)/$(WP_PACKAGE)-$(WP_NAME).xml

clean:
	rm -f $(WP_NAME).png;