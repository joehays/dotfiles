#!/bin/bash
echo
echo '============================================================'
echo 'PROGRAMS/TLDR.SH'
echo '============================================================'

# get my own absolute path
SCRIPT_ABS_DIR=$(dirname $(readlink -f -- "$0"; ));
NPM_INSTALL="${SCRIPT_ABS_DIR}/../cond-npm-install"

echo
echo '------------------------------'
echo 'Installing TLDR dependencies'
echo '------------------------------'
${NPM_INSTALL} axios
${NPM_INSTALL} tldr

link_target="/usr/local/bin/tldr"
link_name="/usr/bin/tldr"

echo
echo '------------------------------'
echo 'Installing TLDR'
echo '------------------------------'

# Check if the symbolic link already exists
if [ ! -e "$link_name" ]; then
    # Create the symbolic link
    sudo ln -s "$link_target" "$link_name"
    echo "Symbolic link created."
else
    echo "Symbolic link already exists. Doing nothing."
fi
