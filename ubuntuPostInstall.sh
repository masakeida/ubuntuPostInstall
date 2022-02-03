#!/bin/sh

usage() {
    cat <<EOF
Usage:
    $(basename ${0}) [<options>]
Options:
    --version, -v     print $(basename ${0}) version
    --vmware, -w      configure for vmware
EOF
}

version() {
    cat <<EOF
$(basename ${0}): 20220115
EOF
}

# default vmware flag is no
VMWARE=NO

while [ $# -gt 0 ];
do
    case ${1} in

	--version|-v)
	    version
	    exit 0
	    ;;

	--vmware|-w)
	    VMWARE=YES
	    ;;

	*)
	    echo "Invalid argment '${1}'"
	    usage
	    exit 1
	    ;;

    esac
    shift
done

# get login name by uid 1000
# it is not used below. it is for the future.
# NUSER=`id -u -n 1000`

# modify pkg_list.txt for vmware
if [ ${VMWARE} = "YES" ]; then
    cat >> pkg_list.txt <<EOF
# vmware tools
open-vm-tools-desktop
EOF
fi

# update
apt-get update
apt-get upgrade
apt-get dist-upgrade

# packages
./aptgetInstaller.sh pkg_list.txt

# disable server suite
./disableServers.sh server_list.txt
