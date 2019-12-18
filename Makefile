# Supported Release Build 

RM = rm -f
MV = mv -f
LN = ln -s
CP_F = cp -f

DESTDIR   = "/tmp"
INCLUDEDIR= "$(DESTDIR)/usr/local/include"
LIBDIR    = "$(DESTDIR)/usr/local/lib"
SALIBDIR  = "$(PWD)/release/lib"
BINDIR    = "$(DESTDIR)/usr/local/bin"
SABINDIR  = "$(PWD)/release/bin"
MANDIR    = "$(DESTDIR)/usr/local/share/man/man1"
SAMANDIR  = "$(PWD)/release/man"
DATADIR   = "$(DESTDIR)/usr/local/share/SAMACOS"

CC_MAKE=make

.PHONY: install_all

install_all: install_lib 
	-mkdir -p $(BINDIR)	
	#-$(RM) $(BINDIR)/sa4cros $(BINDIR)/sa4cros.sh
	#-$(CP_F) $(SABINDIR)/sa4cros $(BINDIR)/sa4cros 
	#-$(CP_F) $(SABINDIR)/sa4cros.sh $(BINDIR)/sa4cros.sh

install_lib:	
	-mkdir -p $(LIBDIR)
	-$(RM) $(LIBDIR)/*.dylib
	-$(CP_F) $(SALIBDIR)/*.dylib $(LIBDIR)/*.dylib
	-mkdir -p $(MANDIR)
	-$(RM) $(MANDIR)/SupportAssist*
	-$(CP_F) $(SAMANDIR)/SupportAssist* $(MANDIR)/.	
