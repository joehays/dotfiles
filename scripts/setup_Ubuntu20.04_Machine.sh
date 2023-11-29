###############################
# Notes to configure my Ubuntu 20.04 machine
# These notes assume a brand new installation of Ubuntu 20.04
###############################

CWD=$(pwd)

echo "----------  SETUP_UBUNTU20.04_MACHINE  ----------"
echo " "
echo "----------  APT UPDATE  ----------"
echo " "
sudo apt-get update

echo " "
echo "----------  APT UPGRADE  ----------"
echo " "
sudo apt-get upgrade -y
sudo apt-get install build-esse
sudo m-a prepare

echo " "
echo "----------  ADD VSCODE PPA  ----------"
echo " "
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo add-apt-repository -y ppa:git-core/ppa

echo " "
echo "----------  APT INSTALL  ----------"
echo " "
sudo apt install -y \
	ssh \
	openssh-server \
	texlive \
	texlive-science \
	texlive-fonts-recommended \
	texlive-latex-extra \
	xzdec \
	vim \
	vim-doc \
	vim-common \
	terminator \
	indicator-multiload \
	x11-utils \
	x11-apps \
	pandoc \
	inxi \
	trash-cli \
	screen \
	python3 \
	python3-venv \
	python3-pip \
	mesa-utils \
	nethogs \
	iftop \
	samba \
	cifs-utils \
	tldr \
	pavucontrol \
	pcsc-tools \
	pcscd \
	libccid \
	opensc \
	libpcsclite1 \
	coolkey \
	libnss3-tools \
	software-properties-common \
	apt-transport-https \
	code \
	git \
	git-lfs \ 
	net-tools \
	nfs-common \
	make \
	libssl-dev \
	zlib1g-dev \
	libbz2-dev \
	libreadline-dev \
	libsqlite3-dev \
	llvm \
	libncurses5-dev \
	libncursesw5-dev \
	xz-utils \
	tk-dev \
	libffi-dev \
	liblzma-dev \
	python-openssl \
	repo \
	ca-certificates

# install HomeBrew
#/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
#test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
#test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
#test -r ~/.bash_profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.bash_profile
#echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.profile

# install pyenv
# https://realpython.com/intro-to-pyenv
# https://github.com/pyenv/pyenv/issues/945
sudo echo "deb http://security.ubuntu.com/ubuntu bionic-security main" >> /etc/apt/sources.list
sudo apt update && apt-cache policy libssl1.0-dev
sudo apt-get install libssl1.0-dev -y
sudo apt autoremove -y
curl https://pyenv.run | bash


# install python 3.5.2

# maybe needed for julia --> llvm-9 llvm-9-dev

echo " "
echo "----------  GIT CONFIG  ----------"
echo " "
git lfs install
git config --local core.sshCommand "ssh -i ~/.ssh/id_rsa_scylla_to_sffs00"

echo " "
echo "----------  SNAP INSTALL  ----------"
echo " "
echo "alias rm=trash" >> ~/.bashrc
echo "export PS1='\u@\h:\w\$ '" >> ~/.bashrc
sudo snap install notepad-plus-plus

echo " "
echo "----------  DUF INSTALL  ----------"
echo " "
mkdir -p ~/apps
cd ~/apps
git clone https://github.com/muesli/duf.git
cd duf
go build
echo "alias duf=~/apps/duf/duf" >> ~/.bashrc
source ~/.bashrc
cd $CWD

echo " "
echo "----------  FSTAB UPDATE  ----------"
echo " "
## Add the following to /etc/fstab 
##sudo echo "//132.250.192.91/Users$/joehays/Private /home/joehays/space/joehays cifs uid=joehays,credentials=/home/joehays/space/.smb_space,dir_mode=0775,sec=ntlmv2,vers=3.0 0 0" >> /etc/fstab
##sudo echo "//132.250.192.91/File_Exchange /home/joehays/space/File_Exchange cifs uid=joehays,credentials=/home/joehays/space/.smb_space,dir_mode=0775,sec=ntlmv2,vers=3.0 0 0" >> /etc/fstab
##sudo echo "//132.250.192.112/MeRLIn /home/joehays/space/MeRLIn cifs uid=joehays,credentials=/home/joehays/space/.smb_space,dir_mode=0775,sec=ntlmv2,vers=3.0 0 0" >> /etc/fstab
##sudo echo "//132.250.192.112/Neuromorphic /home/joehays/space/Neuromorphic cifs uid=joehays,credentials=/home/joehays/space/.smb_space,dir_mode=0775,sec=ntlmv2,vers=3.0 0 0" >> /etc/fstab
##sudo echo "//132.250.192.112/LASRx /home/joehays/space/LASRx cifs uid=joehays,credentials=/home/joehays/space/.smb_space,dir_mode=0775,sec=ntlmv2,vers=3.0 0 0" >> /etc/fstab
##sudo echo "//sffs00.nrl.navy.mil/gitrepo/code_8234/ /home/joehays/space/sffs00_gitrepos cifs uid=joehays,credentials=/home/joehays/space/.smb_space,dir_mode=0775,sec=ntlmv2,vers=3.0 0 0" >> /etc/fstab
##sudo echo "//132.250.192.112/nemo /home/joehays/space/nemo cifs uid=joehays,credentials=/home/joehays/space/.smb_space,dir_mode=0700,sec=ntlmv2,vers=3.0 0 0" >> /etc/fstab
##sudo echo "//132.250.192.112/Safe_Life_Long_Motor_Learning /home/joehays/space/sllml cifs uid=joehays,credentials=/home/joehays/space/.smb_space,dir_mode=0700,sec=ntlmv2,vers=3.0 0 0" >> /etc/fstab
##sudo echo "//132.250.119.66/projects/wisard /home/joehays/space/wisard cifs uid=joehays,credentials=/home/joehays/space/.smb_CCS,dir_mode=0700,sec=ntlmv2,vers=3.0 0 0" >> /etc/fstab
#
## to specify a custom .ssh key file
##sudo mount -a



## Cert stuff
# how to determine the cert from a server
#openssl s_client -showcerts -verify 32 -connect sfgitlab.nrl.navy.mil:5050

echo " "
echo "----------  DISA CERTS  ----------"
echo " "
# need to do something with these certs... can't remember
wget http://iasecontent.disa.mil/pki-pke/Certificates_PKCS7_v5.0u1_DoD.zip
# run 'pcsc_scan' to check if card is being read

# add "client max protocol = SMB3" under the [globals] section in /etc/samba/smb.conf


#######################################################################################################
#######################################################################################################
#######################################################################################################

#sudo apt-get install codium
code --force --install-extension ms-vscode.cpptools
code --force --install-extension yzhang.markdown-all-in-one
code --force --install-extension shd101wyy.markdown-preview-enhanced
code --force --install-extension fabiospampinato.vscode-terminals
code --force --install-extension vscodevim.vim
code --force --install-extension ms-python.python
code --force --install-extension ms-vscode-remote.vscode-remote-extensionpack
code --force --install-extension visualstudioexptteam.vscodeintellicode
code --force --install-extension james-yu.latex-workshop

################################
## Add a new PPA
################################
## https://launchpad.net/~graphics-drivers/+archive/ubuntu/ppa
#source /etc/os-release
#echo $VERSION_CODENAME
#sudo add-apt-repository ppa:graphics-drivers/ppa
#
################################
## NVIDIA
################################
## https://linuxconfig.org/how-to-install-the-nvidia-drivers-on-ubuntu-18-04-bionic-beaver-linux
#sudo add-apt-repository ppa:graphics-drivers/ppa
#sudo apt update
#ubuntu-drivers devices
#sudo ubuntu-drivers autoinstall
#or, 
#sudo apt install nvidia-430

################################
## Fix GLXINFO
################################
## https://forums.developer.nvidia.com/t/opengl-nvidia-and-ubuntu-14-04-issues/52875/6
#sudo apt-get install libgl1-mesa-glx-lts-xenial
#
## Configure for mesa GLX via update-alternatives
#   update-alternatives --set i386-linux-gnu_gl_conf /usr/lib/i386-linux-gnu/mesa/ld.so.conf
#   update-alternatives --set i386-linux-gnu_egl_conf /usr/lib/i386-linux-gnu/mesa-egl/ld.so.conf
#   update-alternatives --set x86_64-linux-gnu_gl_conf /usr/lib/x86_64-linux-gnu/mesa/ld.so.conf
#   update-alternatives --set x86_64-linux-gnu_egl_conf /usr/lib/x86_64-linux-gnu/mesa-egl/ld.so.conf
#
##To switch back to nvidia
#
## Configure for nvidia GLX via update-alternatives
#   update-alternatives --set i386-linux-gnu_gl_conf /usr/lib/${nvidia_driver}/alt_ld.so.conf
#   update-alternatives --set i386-linux-gnu_egl_conf /usr/lib/${nvidia_driver}/alt_ld.so.conf
#   update-alternatives --set x86_64-linux-gnu_gl_conf /usr/lib/${nvidia_driver}/ld.so.conf
#   update-alternatives --set x86_64-linux-gnu_egl_conf /usr/lib/${nvidia_driver}/ld.so.conf
#
################################
## CUDA
################################
## https://docs.nvidia.com/cuda/cuda-installation-guide-linux/#verify-that-gcc-is-installed 
## https://developer.nvidia.com/cuda-downloads?target_os=Linux&target_arch=x86_64&target_distro=Ubuntu&target_version=1604&target_type=debnetwork
#sudo apt-get install linux-headers-$(uname -r)
#wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-ubuntu1604.pin
#sudo mv cuda-ubuntu1604.pin /etc/apt/preferences.d/cuda-repository-pin-600
#sudo apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/7fa2af80.pub
#sudo add-apt-repository "deb http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/ /"
#sudo apt-get update
#sudo apt-get -y install cuda



################################
## install MikTex: ---> might be better to use texlive + texlive-science + texlive-fonts-recommended + texlive-latex-extra
## https://miktex.org/
################################
#sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys D6BC243565B2087BC3F897C9277A7293F59E4889
#echo "deb http://miktex.org/download/ubuntu xenial universe" | sudo tee /etc/apt/sources.list.d/miktex.list
#sudo apt-get update
#sudo apt-get install -y miktex latexmk 
## or,
#sudo apt-get install -y texlive texlive-science texlive-fonts-recommended texlive-latex-extra xzdec
## or, texlive-full
#
#codium --force --install-extension james-yu.latex-workshop
#
#
##  The following commands create the required directory hierarchy and register the .cls file:
#   - mkdir -p $HOME/.texmf/tex/latex/memo
#   - sudo /usr/bin/tlmgr conf texmf TEXMFHOME $HOME/.texmf
#   - mv amazingbook.cls $HOME/.texmf/tex/latex/amazing
#   - mktexlsr $HOME/.texmf
#   - latex amazing-stories-1.tex
#
#The pdflatex command can now find amazingbook.cls.
#
## https://www.latextemplates.com/template/memo
## curl -O http://www.latextemplates.com/templates/miscellaneous/9/memo.zip
## git clone https://github.com/charlesangus/texMemo.git
#
################################
## install VBox: 
## https://www.virtualbox.org/wiki/Linux_Downloads
## https://appuals.com/install-virtualbox-ubuntu-16-04/
## https://virtualboxes.org/doc/installing-guest-additions-on-ubuntu/
## https://websiteforstudents.com/virtualbox-6-0-is-out-heres-how-to-install-upgrade-on-ubuntu-16-04-18-04-18-10/
## https://www.virtualbox.org/wiki/Testbuilds
## https://www.techrepublic.com/article/how-to-run-virtualbox-virtual-machines-from-the-command-line/
################################
#sudo apt update
#sudo apt-get install gcc make linux-headers-$(uname -r) dkms
#wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
#wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
#sudo sh -c 'echo "deb http://download.virtualbox.org/virtualbox/debian $(lsb_release -sc) contrib" >> /etc/apt/sources.list.d/virtualbox.list'
#sudo apt remove virtualbox virtualbox-5.2
#sudo apt update
#sudo apt-get install virtualbox-6.0
## now install the extension pack,
## https://www.virtualbox.org/wiki/Downloads
## FILE -> PREFERENCES -> EXTENSIONS -> ADD
## add yourself to the 'vboxusers' group
#
## https://forums.virtualbox.org/viewtopic.php?t=59462
## Click 'install guest additons...' from the Devices menu and then choose to browse the CD
## sudo sh /media/joehays/VBox_GAs_5.2.1/VBoxLinuxAdditions.run 
## reboot
 
################################
## install other useful tools 
################################
#sudo apt-get install -y vim vim-doc vim-common terminator indicator-multiload x11-utils x11-apps pandoc inxi trash-cli screen python3 python3-venv python3-pip mesa-utils
#echo "alias rm=trash" >> ~/.bashrc
#echo "export PS1='\u@\h:\w\$ '" >> ~/.bashrc
#sudo snap install notepad-plus-plus

################################
## Networking
################################
## http://linux-sys-adm.com/ubuntu-16.04-lts-how-to-install-and-configure-samba/ 
## https://www.configserverfirewall.com/ubuntu-linux/mount-samba-share-ubuntu-cifs/
## https://wiki.samba.org/index.php/Package_Dependencies_Required_to_Build_Samba
## libpopt-dev libreadline-dev nettle-dev perl perl-modules pkg-config \
#
#sudo apt-get -y install samba cifs_utils 
## add "client max protocol = SMB3" under the [globals] section in /etc/samba/smb.conf
#
## https://wiki.ubuntu.com/MountWindowsSharesPermanently
## Add the following to /etc/fstab 
#//132.250.192.91/Users$/joehays/Private /home/joehays/space/joehays cifs uid=joehays,credentials=/home/joehays/space/.smb_space,dir_mode=0775,sec=ntlmv2,vers=3.0 0 0
#//132.250.192.91/File_Exchange /home/joehays/space/File_Exchange cifs uid=joehays,credentials=/home/joehays/space/.smb_space,dir_mode=0775,sec=ntlmv2,vers=3.0 0 0
#//132.250.192.112/MeRLIn /home/joehays/space/MeRLIn cifs uid=joehays,credentials=/home/joehays/space/.smb_space,dir_mode=0775,sec=ntlmv2,vers=3.0 0 0
#//132.250.192.112/Neuromorphic /home/joehays/space/Neuromorphic cifs uid=joehays,credentials=/home/joehays/space/.smb_space,dir_mode=0775,sec=ntlmv2,vers=3.0 0 0
#//132.250.192.112/LASRx /home/joehays/space/LASRx cifs uid=joehays,credentials=/home/joehays/space/.smb_space,dir_mode=0775,sec=ntlmv2,vers=3.0 0 0
## mount GIT servers from SFFS00.NRL.NAVY.MIL
##//sffs00.nrl.navy.mil/gitrepo/code_8234/ /home/joehays/space/sffs00_gitrepos cifs uid=joehays,credentials=/home/joehays/space/.smb_space,dir_mode=0775,sec=ntlmv2,vers=3.0 0 0
#
## sudo mount -a
#
################################
## Visual Studio Code
################################
## https://linuxize.com/post/how-to-install-visual-studio-code-on-ubuntu-18-04/
#sudo apt-get install -y software-properties-common apt-transport-https wget
#wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
#sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
#sudo apt-get install -y code
#
################################
## rsync and cron
################################
## https://www.tecmint.com/rsync-local-remote-file-synchronization-commands/
## https://askubuntu.com/questions/320458/how-to-exclude-multiple-directories-with-rsync
## https://www.howtogeek.com/135533/how-to-use-rsync-to-backup-your-data-on-linux/
## https://linux.die.net/man/1/rsync
## https://stackoverflow.com/questions/35364075/using-rsync-filter-to-include-exclude-files
## https://www.thegeekstuff.com/2011/01/rsync-exclude-files-and-folders/
## https://stackoverflow.com/questions/23666700/how-can-i-format-an-rsync-exclude-from-file-so-it-excludes-files-dirs-but-inclu?rq=1
#
## rsync_joehays.sh
#rsync -avu --dry-run --progress --exclude-from=/path/to/rsync_exclude_me --delete /src /dest
#
## rsync_exclude_me
#+ /folder1/
#+ /folder1/folder2/
#+ /folder1/folder2/file1
#- /folder1/***
#- /folder3/file2
#
## now add the following with crontab -e
## https://opensource.com/article/17/11/how-use-cron-linux
#00 07-20 * * * /home/joehays/utils/rsync_joehays.sh
#
## or, use Unison to synchronize instead
## https://www.tecmint.com/file-synchronization-in-linux-using-unison/
#sudo apt-get -y install unison unison-gtk 
#
################################
## SVN foo
################################
## partial checkouts: https://stackoverflow.com/questions/50945/can-you-do-a-partial-checkout-with-subversion
#
################################
## Remote Desktop
################################
## https://www.digitalcitizen.life/connecting-windows-remote-desktop-ubuntu
## https://github.com/FreeRDP/Remmina/
#
#sudo apt-add-repository ppa:remmina-ppa-team/remmina-next
#sudo apt-get update
#sudo apt-get install -y remmina remmina-plugin-rdp libfreerdp-plugins-standard
#
################################
## SSH server
################################
## http://ubuntuhandbook.org/index.php/2016/04/enable-ssh-ubuntu-16-04-lts/
## https://www.sparxeng.com/blog/software/forward-linux-x11-session-windows
## https://kb.iu.edu/d/bdnt
## https://unix.stackexchange.com/questions/327532/how-to-remotely-log-in-with-full-graphical-desktop-over-x11
## https://hpcf.umbc.edu/general-productivity/running-x-windows-programs-remotely/ 
# 
# sudo apt install openssh-server
#sudo service ssh status
#sudo vim /etc/ssh/sshd_config
#sudo vim /etc/ssh/ssh_config
## sudo vim /etc/hosts.allow
#	sshd : .nrl.navy.mil : ALLOW
#	sshd : 132.250.*.* : ALLOW
#	sshd : ALL : DENY
## sudo vim /etc/hosts.deny
#	sshd: ALL
##sudo service ssh restart
#
#
################################
## SSH Keys
################################
## https://www.digitalocean.com/community/tutorials/how-to-set-up-ssh-keys-on-ubuntu-1604
#ssh-keygen
#ssh-copy-id <username>@remote_host
#
#
################################
## X11 Forwarding
################################
## https://blog.ssdnodes.com/blog/remote-linux-desktop-vps-ssh-vnc/
#ssh -XC ncl-nrl.research.intel-research.net
#xfce4-session
#
################################
## PDF viewer
################################
#evince
#
################################
## Sound
################################
## https://itsfoss.com/fix-sound-ubuntu-1304-quick-tip/
#alsamixer
#sudo alsa force-reload
#sudo apt-get install pulseaudio pavucontrol
#
################################
## CAC Reader
################################
## https://militarycac.com/
## http://cackey.rkeene.org/download/0.7.5/cackey_0.7.5-1_amd64.deb
## https://help.ubuntu.com/community/CommonAccessCard
## https://progmar.net.pl/en/knowledge-base/ubuntu-virtualbox-and-usb-devices
## https://iase.disa.mil/pki-pke/getting_started/Pages/linux.aspx
#sudo apt-get install -y pcsc-tools pcscd libccid opensc libpcsclite1
#wget http://iasecontent.disa.mil/pki-pke/Certificates_PKCS7_v5.0u1_DoD.zip
#sudo apt-get install -y coolkey
#
## run 'pcsc_scan' to check if card is being read
#
################################
## web certificates
################################
## https://help.ubuntu.com/community/CommonAccessCard
#sudo apt-get install -y libnss3-tools
#
#
################################
## tldr
################################
## https://tldr.sh/
## https://itsfoss.com/tldr-linux-man-pages-simplified/
#
################################
## Logitech unifying receiver
################################
## solaar
#
################################
## Open file using default application
################################
## xdg-open  
#
################################
## SCP files
################################
## from server to local machine
#scp -r username@host.com:/path/to/dir local/path
#
#
################################
## Change keyring password
################################
## https://mensfeld.pl/2014/09/ubuntu-14-04-gnome-keyring-seahorse-auto-unlock-when-auto-login/ 
#
#
#
################################
## Anaconda
################################
#sudo apt-get -y install libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6
##wget -q https://repo.anaconda.com/archive/Anaconda3-2019.10-Linux-x86_64.sh
#wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/Downloads/miniconda.sh
#bash ~/Downloads/miniconda.sh -b -p $HOME/apps/miniconda
##pip install -e .
## https://docs.anaconda.com/anaconda/install/linux/ 
#
#
########################################
##  Tensorflow and other tools
########################################
#python3 -m venv ~/.venv/tensorflow
#source ~/.venv/tensorflow/bin/activate
#pip install -U pip
#pip install jupyter notebook
#pip install --upgrade tensorflow
#python3 -c "import tensorflow as tf;print(tf.reduce_sum(tf.random.normal([1000, 1000])))"
# 
## set vscode to use .venv
#
########################################
##  Network monitoring
########################################
## https://www.linux.com/tutorials/3-simple-excellent-linux-network-monitors/
## https://github.com/raboof/nethogs
#sudo apt-get install -y nethogs iftop
#
#
########################################
##  Git
########################################
## make sure that you have version 2.10 or greater!
#sudo add-apt-repository -y ppa:git-core/ppa
#sudo apt-get update
#sudo apt-get install git -y
#
## to specify a custom .ssh key file
#git config --local core.sshCommand "ssh -i ~/.ssh/id_rsa_scylla_to_sffs00"
#
#
#
#
