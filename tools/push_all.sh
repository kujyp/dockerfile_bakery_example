#!/bin/bash -e

yellow="\033[0;33m"
red="\033[0;31m"
nocolor="\033[0m"

get_script_path() {
    local _src="${BASH_SOURCE[0]}"
    while [[ -h "${_src}" ]]; do
        local _dir="$(cd -P "$( dirname "${_src}" )" && pwd)"
        local _src="$(readlink "${_src}")"
        if [[ "${_src}" != /* ]]; then _src="$_dir/$_src"; fi
    done
    echo $(cd -P "$(dirname "$_src")" && pwd)
}

cd_into_script_path() {
    local script_path=$(get_script_path)
    cd ${script_path}
}

command_exists() {
    command -v "$@" > /dev/null 2>&1
}


### Main
echo -e "${yellow}[INFO] [${BASH_SOURCE[0]}] executed.${nocolor}"

if ! command_exists docker; then
    echo -e "${red}[ERROR] Install docker first.\n\
[MacOS] $ brew cask install docker\n\
[Linux] $ curl -fsSL https://get.docker.com | sh${nocolor}"
    exit 1;
fi

(
cd_into_script_path
./build_all.sh
for each_script in ../generated/scripts/push_*.sh; do
    ${each_script}
done
)
echo -e "${yellow}[INFO] [${BASH_SOURCE[0]}] done.${nocolor}"
