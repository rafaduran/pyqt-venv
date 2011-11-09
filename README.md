# README

This simple project is a develpment tool for PyQt installation under virtualenv,
you will need sudo permissions and a internet connection. The script installs
Sip 4.13 and PyQt 4.8.6 versions, in addition Qt development libraries will be 
installed on your system.

*Notice:* This script has been tested only under Ubuntu Oneiric

# Install
Installation is as simple as run the script pyqtenv.sh:

    $ ./pyqtenv.sh

But in order to be full unattended you need to agreed PyQt license:

    $ export LICENSE=--confirm-license

Otherwise you will be prompted during installation procedure. You can also
configure destination directory:

    $ export DEST_DIR=/dest/path

