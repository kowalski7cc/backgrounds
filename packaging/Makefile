WP_PACKAGE=kowalski7cc
WP_NAME=packaging
WP_DIR=$(DESTDIR)/usr/share/backgrounds/$(WP_PACKAGE)
GNOME_BG_DIR=$(DESTDIR)/usr/share/gnome-background-properties
KDE_BG_DIR=$(DESTDIR)/usr/share/wallpapers
PLASMA_BG_DIR=$(DESTDIR)/usr/share/plasma/desktoptheme
XFCE_BG_DIR=$(DESTDIR)/usr/share/xfce4/backdrops
MKDIR=/bin/mkdir -p
INSTALL=/usr/bin/install -p -m644 -D
LN_S=/bin/ln -s
CP=/bin/cp -p

all:
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

	#~ KDE and Plasma background
	$(MKDIR) $(KDE_BG_DIR)/$(WP_PACKAGE)_background_$(WP_NAME)/contents/images
	$(MKDIR) $(KDE_BG_DIR)/$(WP_PACKAGE)_background_$(WP_NAME)/contents/images_dark
	$(INSTALL) metadata.json $(KDE_BG_DIR)/$(WP_PACKAGE)_background_$(WP_NAME)/metadata.json
	for res in 3840x3840; do \
		$(INSTALL) $(WP_NAME)-day.png \
	        	$(KDE_BG_DIR)/$(WP_PACKAGE)_background_$(WP_NAME)/contents/images/$${res}.png ; \
		$(INSTALL) $(WP_NAME)-night.png \
				$(KDE_BG_DIR)/$(WP_PACKAGE)_background_$(WP_NAME)/contents/images_dark/$${res}.png ; \
	done;

	#~ XFCE background
	$(MKDIR) $(XFCE_BG_DIR)
	$(INSTALL) $(WP_NAME)-day.png $(XFCE_BG_DIR)/$(WP_PACKAGE)_background_$(WP_NAME).png

clean:
	for tod in day night; do \
	  rm -f $(WP_NAME)-$${tod}.png; \
	done;