#!/bin/sh
#
# aptgetInstaller.sh
#
#    Install packages in pkg_list.txt
#

usage() {
    cat <<EOF
Usage:
    $(basename ${0}) pkg_list_file
EOF
}

version() {
    echo "$(basename ${0}) version 0.0.1"
}

if [ $# -ne 1 ]; then
    version
    usage
    exit 1
fi

filename=$1

if [ ! -e ${filename} ]; then
    echo "${filename} does not exist. Stopped."
    exit 1
fi

#export ASSUME_ALWAYS_YES=yes

cat ${filename} | grep -v "^#" | grep -v "^$" | while read line
do
    # install pakages
    apt-get -y install ${line}
done
