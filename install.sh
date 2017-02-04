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

echo "==================="
echo "Pull submodule repo"
echo "==================="

git submodule init nali-ipip
git submodule update
chmod 0765 ${INSTDIR}/nali-ipip/configure

echo "======================"
echo "Update submodule files"
echo "======================"

rm -f ${INSTDIR}/nali-ipip/share/nali.pl
rm -f ${INSTDIR}/nali-ipip/bin/nali-mtr
cp ${INSTDIR}/files/nali.pl ${INSTDIR}/nali-ipip/share/
cp ${INSTDIR}/files/nali-mtr ${INSTDIR}/nali-ipip/bin/

ARCH=`uname -i`

mkdir ${INSTDIR}/tmp

if [ "$ARCH" == "x86_64" ]; then
    echo "==============================="
    echo "Install removeDuplicates x86_64"
    echo "==============================="
    cp ${INSTDIR}/build/removeDuplicates_amd64 ${INSTDIR}/tmp/
    mv ${INSTDIR}/tmp/removeDuplicates_amd64 ${INSTDIR}/tmp/rd
    mv ${INSTDIR}/tmp/rd /usr/local/bin/
    chmod 0555 /usr/local/bin/rd
    fi

if [ "$ARCH" == "i386" ]; then
    echo "============================="
    echo "Install removeDuplicates i386"
    echo "============================="
    cp ${INSTDIR}/build/removeDuplicates_i386 ${INSTDIR}/tmp/
    mv ${INSTDIR}/tmp/removeDuplicates_i386 ${INSTDIR}/tmp/rd
    mv ${INSTDIR}/tmp/rd /usr/local/bin/
    chmod 0555 /usr/local/bin/rd
    fi

echo "====================================="
echo "Install dzxx36gyy/nali-ipip submodule"
echo "====================================="

pushd ${INSTDIR}/nali-ipip/
./configure
make
make install

pushd ${INSTDIR}

echo "================="
echo "Install Finished."
echo "================="