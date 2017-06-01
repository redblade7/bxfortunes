# bxfortunes

BitchX Fortunes for Linux v1.11

Created by redblade7, June 1, 2017

Last updated June 1, 2017 (v1.11)

BitchX Fortunes for Linux provides about 800 fortunes based on kick, quit, and other messages from BitchX, an IRC client popular in the late 90s/early 00s. The Makefile allows you to customize the fortunes, such as your IRC nickname, a kicked user's nickname, and such things as "year of the BitchX" and "official IRC client of the Olympic Games".

By default, the value of $USER at the time of running make is used for both nickname and kicked user's nickname, with the 2012 Olympic Games used and 2017 as the year of the BitchX. Again you can change all this by editing the Makefile.

These fortunes qualify as "offensive" and, once installed, are viewable via the -o, off/ and -a options (see below).

Enjoy! -redblade7

LICENSE:

The original BitchX source material is Copyright (c) 1990-2014, Michael Sandroff et al. and is licensed under the New BSD License.

All other material is Copyright (c) 2017, redblade7 and is licensed under the FreeBSD License.

See LICENSE for more information.

INSTRUCTIONS:

First, edit the Makefile to customize the fortunes and ensure settings are correct.

Then, for instructions, type:

* "make"

The location and handling of offensive fortunes differs between systems. There are two (un)installation options: one to (un)install the fortunes on Debian/Ubuntu/Mint systems, and one to (un)install the fortunes on Slackware systems.

To try out, after installation, leave the source directory and type:

* "fortune off/bxfortunes" (Debian/Ubuntu/Mint)
* "fortune bxfortunes-o" (Slackware)

NOTES:

* Slackware Linux users: Slackware will not automatically choose fortunes from these files unless you add "bxfortunes-o" to the end of the fortune command in /etc/profile.d/bsd-games-login-fortune.sh. Note that this will enable offensive fortunes for all the fortunes on that command line. You can also replace the whole line with "fortune -a" to include all installed fortunes, offensive and not.

CHANGES:
* v1.11 (2017-06-01): Updated version info on all files
* v1.1 (2017-06-01): Removed unnecessary Makefile setting
* v1.0 (2017-06-01): Initial release
