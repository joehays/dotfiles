#!/bin/bash

echo
echo '============================================================'
echo 'PROGRAMS/TURBUVNC.SH'
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
echo 'Downloading TurboVNC'
echo '------------------------------'

version="3.1.1"
filename="turbovnc_${version}_amd64.deb"
url="https://github.com/TurboVNC/turbovnc/releases/download/${version}/${filename}"

if [ ! -f "${HOME}/Downloads/${filename}" ]; then
    wget ${url}
    chmod +x turbovnc_3.1.1_amd64.deb
else
    echo "ALREADY DOWNLOADED: ${url}" 
fi

echo
echo '------------------------------'
echo 'Installing TurboVNC'
echo '------------------------------'

if [ ! -f "/opt/TurboVNC/bin/vncserver" ]; then
    sudo dpkg -i ${filename}
    sudo apt install -f
else
    echo "ALREADY INSTALLED: /opt/TurboVNC/bin/vncserver "
fi
cmd="/opt/TurboVNC/bin/vncserver -localhost"
${COND_INSERT} "alias turbo=\"${cmd}\"" ${HOME}/.bashrc

echo
echo '------------------------------'
echo 'Configure TurboVNC as an automatic startup application'
echo '------------------------------'
# From: https://www.simplified.guide/linux/automatically-run-program-on-startup
# From: https://stackoverflow.com/questions/878600/how-to-create-a-cron-job-using-bash-automatically-without-the-interactive-editor

#EDITOR=$(which vim) crontab -e
if [[ ! "$(crontab -l)" == *"${cmd}"* ]]; then
    (crontab -l ; echo "@reboot sh /opt/TurboVNC/bin/vncserver -localhost :1") | crontab -
else
    echo 'ALREADY CONFIGURED AS CRON TASK: "@reboot sh /opt/TurboVNC/bin/vncserver -localhost '
fi

${cmd} :1

# TODO: need to copy ~/.vnc/passwd to DOTFILES and then symlink it from DOTFILES to ~/.vnc/passwd

cd ${CWD}
