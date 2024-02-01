#!/bin/bash

##############################################################################
# this is a launcher script run inside the container!!
##############################################################################


source /tools/set_env.sh
export PATH=$PATH:/tools
if [ $# -eq 0 ] 
then
    echo "No program name/arguments given to run!"
    exit 1
fi

program=$1
shift
exec $program $*
