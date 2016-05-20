#!/bin/bash
#for taobao abs
#sudo yum install libunwind.x86_64 google-perftools.x86_64 t-csrd-tbnet-devel.x86_64  -y
temppath=$1
cd $temppath/packages
release=`cat /etc/redhat-release|cut -d " " -f 4|cut -d "." -f 1`
sed -i  "s/^Release:.*$/Release: "$4".el${release}/" $2.spec
sed -i  "s/^Version:.*$/Version: "$3"/" $2.spec
cd $temppath
chmod +x bootstrap.sh
./bootstrap.sh
export TBLIB_ROOT=/usr/local
./configure
make PREFIX=/opt/tair-2.3 TMP_DIR=/home/caster/tmp/tair-tmp.$$ rpms
#make rpms
mv *.rpm rpm/
