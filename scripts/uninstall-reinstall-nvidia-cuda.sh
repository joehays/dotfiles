#!/bin/bash

# https://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html

DISTRO=ubuntu
VERSION=2004
ARCHITECTURE=x86_64
#CUDA_VERSION=11-1
CUDA_VERSION=11-7

#----------------------------------
# "Update kernel headers and development packages"
#----------------------------------
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys A4B469963BF863CC
sudo apt-get update
sudo apt-get install -y linux-headers-$(uname -r)

#if true;
#else
   #----------------------------------
   # "Remove CUDA and NVIDIA drivers:"
   #----------------------------------
   # "To remove CUDA Toolkit:"
   sudo apt-get --purge remove "*cublas*" "*cufft*" "*curand*" \
      "*cusolver*" "*cusparse*" "*npp*" "*nvjpeg*" "cuda*" "nsight*" -y

   # "To remove NVIDIA Drivers:"
   sudo apt-get --purge remove "*nvidia*" -y
   sudo apt autoremove -y
#fi

if false;
   # ----------------------------------
   # "Reinstall CUDA + NVIDIA drivers:"
   #----------------------------------
   # "Install repository meta-data"
   wget https://developer.download.nvidia.com/compute/cuda/repos/$DISTRO$VERSION/$ARCHITECTURE/cuda-$DISTRO$VERSION.pin
   sudo mv cuda-$DISTRO$VERSION.pin /etc/apt/preferences.d/cuda-repository-pin-600

   # "... on Ubuntu 20.04:"
   sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/$DISTRO$VERSION/$ARCHITECTURE/7fa2af80.pub

   # "add Cuda repository:"
   sudo add-apt-repository "deb https://developer.download.nvidia.com/compute/cuda/repos/$DISTRO$VERSION/$ARCHITECTURE/ /"

   # "Update the Apt repository cache"
   sudo apt-get update

   # "Install CUDA"
   #sudo apt install cuda -y
   sudo apt install cuda-$CUDA_VERSION -y
fi

#----------------------------------
# "Reinstall CUDA + NVIDIA drivers:"
#----------------------------------
# "Install repository meta-data"
#sudo dpkg -i cuda-repo-$DISTRO_$VERSION_$ARCHITECTURE.deb

# "... on Ubuntu 16.04:"
#sudo apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/$DISTRO/$ARCHITECTURE/7fa2af80.pub

# "Pin file to prioritize CUDA repository:"
#wget https://developer.download.nvidia.com/compute/cuda/repos/$DISTRO/$ARCHITECTURE/cuda-$DISTRO.pin
#sudo mv cuda-$DISTRO.pin /etc/apt/preferences.d/cuda-repository-pin-600

# "Update the Apt repository cache"
#sudo apt-get update

# "Install CUDA"
#sudo apt install cuda-$CUDA_VERSION -y



