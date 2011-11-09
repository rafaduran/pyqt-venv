#!/usr/bin/env bash

# Global variables, trying to get values from environment
CONFIRM=${LICENSE:-""}
DEST=${DEST_DIR:-`pwd`}

# Getting dependencies
sudo apt-get update
sudo apt-get install -y libqt4-dev build-essential wget unzip python-virtualenv --force-yes

# Creating directory if it doesn't exists
if [ ! -d $DEST ]; then
    mkdir -p $DEST
fi

# Getting tools, sip and PyQt
if [ ! -d $DEST/tools ]; then
    cp -r tools $DEST/tools
fi

cd $DEST

if [ ! -d $DEST/sip-4.13 ]; then
    wget http://www.riverbankcomputing.com/static/Downloads/sip4/sip-4.13.zip
    unzip sip-4.13.zip
fi

if [ ! -d $DEST/PyQt-x11-gpl-4.8.6 ]; then
    wget http://www.riverbankcomputing.com/static/Downloads/PyQt4/PyQt-x11-gpl-4.8.6.tar.gz
    tar -xvzf PyQt-x11-gpl-4.8.6.tar.gz
fi

# Installing virtualenv for PyQt and activating it
python tools/install_venv.py
source .pyqt-venv/bin/activate

# Building and installing both sip and PyQt
cd sip-4.13
python configure.py --bindir ../.pyqt-venv/bin/ --destdir ../.pyqt-venv/lib/python2.7 --incdir ../.pyqt-venv/include/python2.7 --sipdir ../.pyqt-venv/usr/share/sip
make
sudo make install
cd ../PyQt-x11-gpl-4.8.6/
# You will be prompted during PyQt building unless you excplicitly confirm license
# $export LICENSE=--confirm-license
python configure.py --bindir ../.pyqt-venv/bin/ --destdir ../.pyqt-venv/lib/python2.7/site-packages/ --no-designer-plugin --sipdir ../.pyqt-venv/usr/share/sip/PyQt4 --no-qsci-api $CONFIRM
make
make install

