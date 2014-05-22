#!/bin/bash
if [ "$1" = "" ]
then
 echo "Usage: $0 <package name> <package version> <tar file name>"
 exit
fi

if [ "$2" = "" ]
then
 echo "Usage: $0 <package name> <package version> <tar file name>"
 exit
fi

if [ "$3" = "" ]
then
 echo "Usage: $0 <package name> <package version> <tar file name>"
 exit
fi

PACKAGE=$1
VERSION=$2
TAR=$3

fpm --license 'Apache 2.0' --vendor 'Kurron Technology' --maintainer 'kurr@jvmguy.com' --before-install before-install --after-install after-install --before-remove before-remove --after-remove after-remove -s tar -t deb -n ${PACKAGE} -v ${VERSION} ${TAR} 

# verify the package
dpkg --info ${PACKAGE}_${VERSION}.deb
