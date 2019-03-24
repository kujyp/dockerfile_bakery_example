#!/bin/bash -e

yellow="\033[0;33m"
red="\033[0;31m"
nocolor="\033[0m"

cd_into_gitrootdir() {
    local topdir=$(git rev-parse --show-toplevel)
    cd ${topdir}
}

command_exists() {
    command -v "$@" > /dev/null 2>&1
}


### Main
echo -e "${yellow}[INFO] [${BASH_SOURCE[0]}] executed.${nocolor}"

if ! command_exists dockerfile_bakery; then
    echo -e "${red}[ERROR] Install dockerfile_bakery first.\n\
$ pip install dockerfile_bakery${nocolor}"
    exit 1;
fi

(
cd_into_gitrootdir
dockerfile_bakery generate
)
echo -e "${yellow}[INFO] [${BASH_SOURCE[0]}] done.${nocolor}"
