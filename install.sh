#!/bin/bash

VERSION="0.33.11"

usage () {
    printf "Usage: ${0##*/} [-v VERSION | -h]\n"
    printf "OPTIONS\n"
    printf "\t[-v VERSION]\n\n"
    printf "\tnvm version will be installed, default is ${VERSION:-unset}.\n\n"
    printf "\t[-h]\n\n"
    printf "\tThis help.\n\n"
    exit 255
}

while getopts v:h opt; do
    case $opt in
        v)
            VERSION=$OPTARG
            ;;
        h|*)
            usage
            ;;
    esac
done

SCRIPT="https://raw.githubusercontent.com/creationix/nvm/v$VERSION/install.sh"

# dependencies
yum install -y gcc-c++ openssl-devel make || exit

# nvm
curl -o- "$SCRIPT" | bash
exit
