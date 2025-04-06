#!/bin/bash

sudo -v
if [ $? != 0 ]; then
    echo "Unable to obtain the necessary privileges. Exiting..."
    echo -n "Press <Enter> to continue. "
    read WER
    exit $?
fi

echo
echo '============================================================'
echo 'FONTS.SH'
echo '============================================================'

# get my own absolute path
SCRIPT_ABS_DIR=$(dirname $(readlink -f -- "$0"; ));
echo "SCRIPT_ABS_DIR = ${SCRIPT_ABS_DIR} "

COND_INSERT="${SCRIPT_ABS_DIR}/../cond-insert-string-into-file"
echo "COND_INSERT = ${COND_INSERT} "

# Set your default font storage directory here
DEFAULT_FONT_DIR="$HOME/.fonts"

# Set the default font installation directory here
FONT_INSTALL_DIR="/usr/share/fonts/truetype/font-install"
sudo mkdir -p ${FONT_INSTALL_DIR}

CWD=$(pwd)
mkdir -p ${DEFAULT_FONT_DIR}
cd ${DEFAULT_FONT_DIR}

echo
echo '------------------------------'
echo 'Download & Install FONTS'
echo '------------------------------'

url="https://github.com/ryanoasis/nerd-fonts/releases/latest/download"
EXT="ttf"

# create list of fonts from this URL
fonts=("FiraCode" "0xProto" "VictorMono")

# Iterate over the array and print each element
for font in "${fonts[@]}"; do
  mkdir -p ${DEFAULT_FONT_DIR}/${font}
  cd ${DEFAULT_FONT_DIR}/${font}

  echo "curl -OL ${url}/${font}.tar.xz"
  curl -OL ${url}/${font}.tar.xz

  echo "tar xf ./${font}.tar.xz"
  tar xf ./${font}.tar.xz 
  
  echo "installing ${font}..."
  for i in *."$EXT"; do
      echo "   sudo cp \"$i\" \"$FONT_INSTALL_DIR\""
      sudo cp "$i" "$FONT_INSTALL_DIR"
  done
  echo "---"

  cd ${DEFAULT_FONT_DIR}
done

echo
echo "Updating the font cache... 'sudo fc-cache -fv'"
sudo fc-cache -fv

if [ $? != 0 ]; then
    echo "Error updating the font cache. Your fonts haven't been completely installed. Try running sudo fc-cache -fv manually. Exiting..."
    exit 1
fi

echo
echo "Fini..."
echo

##${COND_INSERT} "alias lzg=\"lazygit\"" ${HOME}/.bashrc

### TODO: delete downloaded files

cd ${CWD}
