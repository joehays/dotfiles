#!/bin/bash
echo
echo '============================================================'
echo 'PROGRAMS/NERDFONTS.SH'
echo '============================================================'

# get my own absolute path
SCRIPT_ABS_DIR=$(dirname $(readlink -f -- "$0"))

CWD=$(pwd)

font_dir="${HOME}/.local/share/fonts"
mkdir -p ${font_dir}
cd ${font_dir}

fonts=("https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/FiraCode.zip")

echo
echo '------------------------------'
echo 'Installing NERDFONTS'
echo '------------------------------'

echo "Downloadings fonts..."

url="${fonts[0]}"

# Extract filename using parameter expansion
filename="${url##*/}"
#path="${url%/*}"

# Check if the symbolic link already exists
#if [ ! -f "${filename}" ]; then
echo "\t${url}"
wget --output-document ${filename} ${url}
unzip ${filename}
fc-cache -f

#rm ${filename}

#else
#  echo "${filename}  already exists. Doing nothing."
#fi

cd ${CWD}
