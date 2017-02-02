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

echo "===================\n"
echo "Pull submodule repo\n"
echo "===================\n"

git submodule init nali-ipip
git submodule update

echo "======================\n"
echo "Update submodule files\n"
echo "======================\n"

rm ${INSTDIR}/nali-ipip/share/nali.pl
cp ${INSTDIR}/files/nali.pl ${INSTDIR}/nali-ipip/share/

ARCH=`uname -i`

mkdir ${INSTDIR}/tmp

echo "========================\n"
echo "Install removeDuplicates\n"
echo "========================\n"

if [ "$ARCH" == "x86_64" ]; then
    cp ${INSTDIR}/build/removeDuplicates_amd64 ${INSTDIR}/tmp/
    mv ${INSTDIR}/tmp/removeDuplicates_amd64 ${INSTDIR}/tmp/rd
    mv ${INSTDIR}/tmp/rd /usr/local/bin/
    chmod 0555 /usr/local/bin/rd
    fi

if [ "$ARCH" == "i386" ]; then
    cp ${INSTDIR}/build/removeDuplicates_i386 ${INSTDIR}/tmp/
    mv ${INSTDIR}/tmp/removeDuplicates_i386 ${INSTDIR}/tmp/rd
    mv ${INSTDIR}/tmp/rd /usr/local/bin/
    chmod 0555 /usr/local/bin/rd
    fi

echo "=====================================\n"
echo "Install dzxx36gyy/nali-ipip submodule\n"
echo "=====================================\n"

pushd ${INSTDIR}/nali-ipip/
./configure
make
make install

pushd ${INSTDIR}

echo "================="
echo "Install Finished."
echo "================="