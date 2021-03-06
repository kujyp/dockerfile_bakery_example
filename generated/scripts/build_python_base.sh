#!/bin/bash -e

###############################################################################
###############################################################################
###                                                                         ###
###                    GENERATED BY PARTIAL DOCKERFILE                      ###
###                    NOTE: DO NOT UPDATE MANUALLY                         ###
###                                                                         ###
###############################################################################
###############################################################################

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
[Centos7] $ yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo && yum install docker-ce\n\
[Centos6] $ yum install docker-io${nocolor}"
    exit 1;
fi

(
cd_into_script_path

docker build --pull -t kujyp/python_base:python2.6.9 -f ../dockerfiles/kujyp/python_base/Dockerfile.python2.6.9 .
docker build --pull -t kujyp/python_base:python2.7.15 -f ../dockerfiles/kujyp/python_base/Dockerfile.python2.7.15 .
docker build --pull -t kujyp/python_base:python3.5.6 -f ../dockerfiles/kujyp/python_base/Dockerfile.python3.5.6 .
docker build --pull -t kujyp/python_base:python3.6.7 -f ../dockerfiles/kujyp/python_base/Dockerfile.python3.6.7 .
docker build --pull -t kujyp/python_base:python3.7.1 -f ../dockerfiles/kujyp/python_base/Dockerfile.python3.7.1 .
)
echo -e "${yellow}[INFO] [${BASH_SOURCE[0]}] Done.${nocolor}"
