#!/bin/sh
usage(){
	echo "Please specify the location where the disk image"
        echo "and configuration file(*boot.ini) to /multics"
        echo "by docker run -v (HOSTDIR):/multics"
        echo ""
        echo "For example:"
        echo "   docker run -it -v /path/to/QuickStart_MR12.6e:/multics -p 6180:6180 (containername) boot"
	echo ""
}

if [ "$1" = "boot" ] ; then 
  if [ -f /multics/*boot.ini ]; then
        cd /multics 
	exec /emu/dps8 *boot.ini
  else
	echo "Cannot find any boot.ini files."
        echo ""
	usage
  fi
elif [ "$1" = "usage" ] ; then
	usage
else 
  exec $1
fi
