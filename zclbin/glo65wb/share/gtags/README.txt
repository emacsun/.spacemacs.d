This is a port of GNU GLOBAL to MS-Windows (32-bit) systems.
GNU GLOBAL is a source code tag system that works the same way across diverse
environments.  It supports C, C++, Yacc, Java, PHP4 and assembly source code.

This README file describes how to install GLOBAL on MS-Windows systems:

    1. Unzip the file gloNNNwb.zip (where NNN is the version number)
       preserving the directory structure.  Add the resulting 'bin'
       directory to your PATH, or copy/move the files in it to a
       directory already on the PATH.

    2. If you need to use a custom configuration file, set the
       environment variable:

	GTAGSCONF=<INSTALLDIR>/share/gtags/gtags.conf

       A default gtags.conf is supplied, but not used.

    3. HTAGS may require the use of the above file (if 'c:/usr' exists, but
       you've installed elsewhere), in order to find the icons it uses.
       Add 'datadir' to it:

	htags:\
	 :datadir=<INSTALLDIR>/share:\
	 :script_alias...

       Note: use slashes and add a backslash before the drive colon.  E.g.:

	 :datadir=c\:/global/share:\

    4. The documentation is in the form of an Info file and man pages.
       If you have Info, this file can be added by:

	cd <INFODIR>
	copy <INSTALLDIR>\share\info
	install-info global.info dir

       This adds a "GLOBAL" entry to the "Development" section.

       If not, the file can be viewed by any text viewer.  The man
       pages are best viewed with LESS.


Jason Hood,
22 March, 2016.
