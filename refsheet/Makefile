WP_PACKAGE=kowalski7cc
WP_NAME=refsheet
WP_DIR=$(DESTDIR)/usr/share/backgrounds/$(WP_PACKAGE)
GNOME_BG_DIR=$(DESTDIR)/usr/share/gnome-background-properties
KDE_BG_DIR=$(DESTDIR)/usr/share/wallpapers
PLASMA_BG_DIR=$(DESTDIR)/usr/share/plasma/desktoptheme
MKDIR=/bin/mkdir -p
INSTALL=/usr/bin/install -p -m644 -D
LN_S=/bin/ln -s
CP=/bin/cp -p

all:
	rsvg-convert -w 3840 -h 3840 -o $(WP_NAME).png $(WP_NAME).svg;

install:
	$(MKDIR) $(WP_DIR)/$(WP_NAME)
	#~ Base background
	$(INSTALL) $(WP_NAME).png $(WP_DIR)/$(WP_NAME)/$(WP_NAME).png ;
	
	#~ GNOME background
	$(MKDIR) $(GNOME_BG_DIR)
	$(INSTALL) gnome-backgrounds-$(WP_NAME).xml $(GNOME_BG_DIR)/$(WP_PACKAGE)-$(WP_NAME).xml

	#~ KDE and Plasma background
	$(MKDIR) $(KDE_BG_DIR)/$(WP_PACKAGE)_background_$(WP_NAME)/contents/images
	$(MKDIR) $(KDE_BG_DIR)/$(WP_PACKAGE)_background_$(WP_NAME)/contents/images_dark
	$(INSTALL) metadata.desktop $(KDE_BG_DIR)/$(WP_PACKAGE)_background_$(WP_NAME)/metadata.desktop
	for res in 3840x3840; do \
		$(INSTALL) $(WP_NAME).png \
	        	$(KDE_BG_DIR)/$(WP_PACKAGE)_background_$(WP_NAME)/contents/images/$${res}.png ; \
	done;
clean:
	rm -f $(WP_NAME).png;