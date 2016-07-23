#!/bin/bash

usage () {
    printf "Usage: ${0##*/} [-v VERSION | -h]\n"
    printf "OPTIONS\n"
    printf "\t[-v VERSION]\n\n"
    printf "\tnvm version, default is 0.31.3.\n\n"
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

[[ -z $VERSION ]] && VERSIION="0.31.3"

SCRIPT="https://raw.githubusercontent.com/creationix/nvm/v$VERSION/install.sh"

# dependencies
sudo yum install -y gcc-c++ openssl-devel make || exit $?

# nvm
curl -o- "$SCRIPT" | bash
exit $?
