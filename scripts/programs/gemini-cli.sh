#!/bin/bash

# export GOOGLE_API_KEY="your_api_key_here"

echo
echo '============================================================'
echo 'PROGRAMS/gemini-cli.SH'
echo '============================================================'

# get my own absolute path
PROGRAMS_ABS_DIR=$(dirname $(readlink -f -- "$0"))
echo "PROGRAMS_ABS_DIR = ${PROGRAMS_ABS_DIR} "

COND_INSERT="${PROGRAMS_ABS_DIR}/../cond-insert-string-into-file"
APT_INSTALL="${PROGRAMS_ABS_DIR}/../cond-apt-install"
NPM_INSTALL="${PROGRAMS_ABS_DIR}/../cond-npm-install"
MAKE_SYMLINK="${PROGRAMS_ABS_DIR}/../cond-make-symlink"

CWD=$(pwd)

echo
echo '------------------------------'
echo 'Installing gemini-cli'
echo '------------------------------'

cd ${HOME}/Downloads
if ! command -v gemini &>/dev/null; then
  echo "Installing: gemini-cli..."
  # ${APT_INSTALL} pipx
  #pipx install google-genai
  ${PROGRAMS_ABS_DIR}/npm.sh
  ${NPM_INSTALL} @google/gemini-cli
else
  echo "Already installed: gemini-cli"
fi

# TODO: delete downloaded files

cd ${CWD}
