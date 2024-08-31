#!/bin/bash

# NOTE: general script is taken from https://www.tug.org/texlive/quickinstall.html

texlive_install_dir="/usr/local/texlive"
bin_dir="${texlive_install_dir}/bin/x86_64-linux"

filename="install-tl-unx.tar.gz"
url="https://mirror.ctan.org/systems/texlive/tlnet/${filename}"

texlive_scheme="scheme-full" #"scheme-basic", "scheme-small", "scheme-medium", "scheme-full" 

echo
echo '============================================================'
echo 'PROGRAMS/TEXLIVE.SH'
echo '============================================================'

# get my own absolute path
SCRIPT_ABS_DIR=$(dirname $(readlink -f -- "$0"; ));
echo "SCRIPT_ABS_DIR = ${SCRIPT_ABS_DIR} "

COND_INSERT="${SCRIPT_ABS_DIR}/../cond-insert-string-into-file"
echo "COND_INSERT = ${COND_INSERT} "

CWD=$(pwd)

cd ${HOME}/Downloads

echo
echo '------------------------------'
echo 'Downloading TexLive'
echo '------------------------------'

if [ ! -f "${HOME}/Downloads/${filename}" ]; then
    wget ${url}
    chmod +x ${filename}
    zcat < install-tl-unx.tar.gz | tar xf -
else
    echo "ALREADY DOWNLOADED: ${url}" 
fi

echo
echo '------------------------------'
echo 'Installing Texlive'
echo '------------------------------'


echo "$(ls -d install-tl*/ | grep -i "install-tl-" | head -c -2)"


if [ ! -d "${texlive_install_dir}" ]; then
    cd "$(ls -d install-tl*/ | grep -i "install-tl-" | head -c -2)"
    sudo perl ./install-tl --no-interaction --paper=letter --no-doc-install --no-src-install --scheme=${texlive_scheme} --texdir=${texlive_install_dir}

    echo "\${COND_INSERT} \"export PATH=\"${bin_dir}:\${PATH}\"\" ${HOME}/.bashrc"
    ${COND_INSERT} "export PATH=\"${bin_dir}:\${PATH}\"" ${HOME}/.bashrc

    echo "\${COND_INSERT} \"export MANPATH=\"/usr/local/texlive/texmf-dist/doc/man:\${MANPATH}\"\" \${HOME}/.bashrc"
    ${COND_INSERT} "export MANPATH=\"/usr/local/texlive/texmf-dist/doc/man:\${MANPATH}\"" ${HOME}/.bashrc

    echo "\${COND_INSERT} \"export INFOPATH=\"/usr/local/texlive/texmf-dist/doc/info:\${INFOPATH}\"\" \${HOME}/.bashrc"
    ${COND_INSERT} "export INFOPATH=\"/usr/local/texlive/texmf-dist/doc/info:\${INFOPATH}\"" ${HOME}/.bashrc

    #echo "sudo addgroup texlive"
    #sudo addgroup texlive

    #echo "sudo chmod -R g+w ${texlive_install_dir}"
    #sudo usermod -aG texlive ${USER}

    echo "sudo chown -R ${USER}:${USER} ${texlive_install_dir}"
    sudo chown -R ${USER}:${USER} ${texlive_install_dir}

    echo "sudo chmod -R g+w ${texlive_install_dir}"
    sudo chmod -R g+w ${texlive_install_dir}
else
    echo "ALREADY INSTALLED: ${texlive_install_dir} "
fi

# Now install missing tex packages
package_list="newtx \
              xpatch \
              xstring \
              mweights \
              fontaxes \
              microtype \
              textcase \
              chngcntr \
              iftex \
              xcolor \
              xkeyval \
              etoolbox \
              latexmk 
             "

echo "${bin_dir}/tlmgr install ${package_list}"
${bin_dir}/tlmgr install ${package_list}



## need to delete the downloaded files

cd ${CWD}
