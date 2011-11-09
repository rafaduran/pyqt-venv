#!/bin/bash
TOOLS=`dirname $0`
VENV=$TOOLS/../.pyqt-venv
source $VENV/bin/activate && $@
