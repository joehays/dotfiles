#!/bin/bash

echo
echo '============================================================'
echo 'PROGRAMS/WEZTERM.SH'
echo '============================================================'

./rust.sh

# get my own absolute path
SCRIPT_ABS_DIR=$(dirname $(readlink -f -- "$0"))
echo "SCRIPT_ABS_DIR = ${SCRIPT_ABS_DIR} "

COND_INSERT="${SCRIPT_ABS_DIR}/../cond-insert-string-into-file"
echo "COND_INSERT = ${COND_INSERT} "
APT_INSTALL="${SCRIPT_ABS_DIR}/../cond-apt-install"

CWD=$(pwd)
apps_dir="${HOME}/apps"
wezterm_dir="${apps_dir}/wezterm"
mkdir -p ${apps_dir}
cd "${apps_dir}"

echo
echo '------------------------------'
echo 'Downloading WEZTERM'
echo '------------------------------'

#NOTE: taken from, https://wezfurlong.org/wezterm/install/source.html

#curl https://sh.rustup.rs -sSf | sh -s
git clone --depth=1 --branch=main --recursive https://github.com/wez/wezterm.git
cd wezterm
git submodule update --init --recursive

echo
echo '----------------------------------'
echo 'Downloading WEZTERM Dependencies'
echo '----------------------------------'
./get-deps

echo
echo '------------------------------'
echo 'Building WEZTERM'
echo '------------------------------'

cargo build --release
#cargo run --release --bin wezterm -- start

#curl https://sh.rustup.rs -sSf | sh -s
#curl -LO https://github.com/wez/wezterm/releases/download/20240203-110809-5046fc22/wezterm-20240203-110809-5046fc22-src.tar.gz
#tar -xzf wezterm-20240203-110809-5046fc22-src.tar.gz --directory="${wezterm_dir"
#cd "${wezterm_dir"/wezterm
#./get-deps
#cargo build --release
##cargo run --release --bin wezterm -- start

cd ${CWD}

