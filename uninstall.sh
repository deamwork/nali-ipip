#!/bin/bash
# Made by Jason (https://github.com/deamwork/)
# You can find repo here: https://github.com/deamwork/nali-ipip
# Thanks to the author of:
# nali-ipip: https://github.com/dzxx36gyy/nali-ipip
# nali: http://www.surfchen.org/nali
# Michael: https://github.com/imWildCat
# IPIP.net

INSTDIR=`pwd`

pushd ${INSTDIR}

echo "=================="
echo "Removing nali-ipip"
echo "=================="

rm -f /usr/local/bin/rd
rm -f /usr/local/bin/ipipnali
rm -f /usr/local/bin/nali 
rm -f /usr/local/bin/nali-traceroute
rm -f /usr/local/bin/nali-tracepath 
rm -f /usr/local/bin/nali-dig
rm -f /usr/local/bin/nali-nslookup
rm -f /usr/local/bin/nali-ping
rm -f /usr/local/bin/nali-mtr 
rm -f /usr/local/bin/nali-update 
rm -f /usr/local/share/17monipdb.dat
rm -f /usr/local/share/nali.pl

echo "================"
echo "Remove Finished."
echo "================"