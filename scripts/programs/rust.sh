#!/bin/bash

echo
echo '============================================================'
echo 'PROGRAMS/RUST.SH'
echo '============================================================'

# get my own absolute path
SCRIPT_ABS_DIR=$(dirname $(readlink -f -- "$0"))
#SCRIPT_ABS_DIR=$(dirname $(readlink -f -- "$0"; ));
echo "SCRIPT_ABS_DIR = ${SCRIPT_ABS_DIR} "

COND_INSERT="${SCRIPT_ABS_DIR}/../cond-insert-string-into-file"
echo "COND_INSERT = ${COND_INSERT} "

CWD=$(pwd)
cd ${HOME}/Downloads

echo
echo '------------------------------'
<<<<<<< HEAD
echo 'Downloading RUST'
echo '------------------------------'

#NOTE: taken from, https://wezfurlong.org/wezterm/install/linux.html

echo 'Downloading && Installing RUST'
echo '------------------------------'

#if [ ! -f "./${downloaded_filename}" ]; then
echo "curl --proto '=https' --tlsv1.2 -sSf ${downloaded_filename} https://sh.rustup.rs | sh"
#curl --proto '=https' --tlsv1.2 -sSf ${downloaded_filename} https://sh.rustup.rs | sh

export RUSTUP_HOME="$HOME/.rustup"
export CARGO_HOME="$HOME/.cargo"
export RUSTUP_TOOLCHAIN="stable"
export RUSTUP_DEFAULT_HOST="x86_64-unknown-linux-gnu"
export RUSTUP_DEFAULT_TARGET="x86_64-unknown-linux-gnu"

bash -c 'curl --proto "=https" --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y'

echo "${COND_INSERT} 'source ${HOME}/.cargo/env' ${HOME}/.zshrc"
${COND_INSERT} "source ${HOME}/.cargo/env" ${HOME}/.zshrc

echo "${COND_INSERT} 'source ${HOME}/.cargo/env' ${HOME}/.bashrc"
${COND_INSERT} "source ${HOME}/.cargo/env" ${HOME}/.bashrc

# TODO: need to conditionally install rust
# TODO: delete downloaded files

cd ${CWD}
