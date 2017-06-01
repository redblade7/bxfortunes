#### BitchX Fortunes for Linux v1.11 ####

## These values should be the same on all systems. 
## If you run into problems then make changes accordingly.
STRFILE = /usr/bin/strfile
ROT13 = /usr/games/rot13
INSTALL = /usr/bin/install
ECHO = /bin/echo
RM = /bin/rm
PREFIX = /usr
SED = /bin/sed

## The source material includes such things as kick messages which are
## customized when compiling the fortunes.
## Change the values to suit your preferences, by default the value of 
## the $USER variable at the time of running make is used.
##
# Your IRC nick
YOURNICK = $(USER)
# Person being kicked
KICKNICK = $(USER)

## Other fun variables
OLYMPICS = 2012
YEAROFTHE = 2017

## You probably shouldn't change these values, they don't mean what you 
## think they mean. See make install for more info.
PCDIR = $(PREFIX)/share/games/fortunes
OFFDIR = $(PREFIX)/share/games/fortunes/off

#### No need to change anything below this line. ####

all:
	@$(ECHO)
	@$(ECHO) BITCHX FORTUNES INSTALLATION INSTRUCTIONS:
	@$(ECHO)
	@$(ECHO) -e "\tEdit Makefile to suit your system and customize preferences, then:"
	@$(ECHO)
	@$(ECHO) make bxfortunes-o
	@$(ECHO)
	@$(ECHO) -e "\tBuilds fortune files, based on the information in Makefile."
	@$(ECHO)
	@$(ECHO) sudo make install-debian
	@$(ECHO)
	@$(ECHO) -e "\tDebian/Ubuntu/Mint: Installs the BitchX fortunes to the Makefile's OFFDIR variable (by default /usr/share/games/fortunes/off)"
	@$(ECHO)
	@$(ECHO) sudo make install-slackware
	@$(ECHO)
	@$(ECHO) -e "\tSlackware: Installs the BitchX fortunes to the Makefile's PCDIR variable as a separate file named \"bxfortunes-o\""
	@$(ECHO)
	@$(ECHO) Uninstallation is similar to above, options are: sudo make uninstall-debian, sudo make uninstall-slackware
	@$(ECHO)

install: all

install-debian: bxfortunes-o
	$(INSTALL) -o root -g root -m 644 bxfortunes-o $(OFFDIR)/bxfortunes
	$(INSTALL) -o root -g root -m 644 bxfortunes-o.dat $(OFFDIR)/bxfortunes.dat

install-slackware: bxfortunes-o
	$(INSTALL) -o root -g root -m 644 bxfortunes-o $(PCDIR)/bxfortunes-o
	$(INSTALL) -o root -g root -m 644 bxfortunes-o.dat $(PCDIR)/bxfortunes-o.dat

clean:
	$(RM) -f bxfortunes.step1
	$(RM) -f bxfortunes.step2
	$(RM) -f bxfortunes.step3
	$(RM) -f bxfortunes.step4
	$(RM) -f bxfortunes-o
	$(RM) -f bxfortunes-o.dat

distclean: clean

uninstall: install

uninstall-debian:
	$(RM) -f $(OFFDIR)/bxfortunes
	$(RM) -f $(OFFDIR)/bxfortunes.dat

uninstall-slackware:
	$(RM) -f $(PCDIR)/bxfortunes-o
	$(RM) -f $(PCDIR)/bxfortunes-o.dat

bxfortunes-o: bxfortunes.source
	$(SED) "s/__YOURNICK__/$(YOURNICK)/g" bxfortunes.source > bxfortunes.step1
	$(SED) "s/__KICKNICK__/$(KICKNICK)/g" bxfortunes.step1 > bxfortunes.step2
	$(SED) "s/__OLYMPICS__/$(OLYMPICS)/g" bxfortunes.step2 > bxfortunes.step3
	$(SED) "s/__YEAROFTHE__/$(YEAROFTHE)/g" bxfortunes.step3 > bxfortunes.step4
	$(ROT13) < bxfortunes.step4 > bxfortunes-o
	$(STRFILE) -x bxfortunes-o
