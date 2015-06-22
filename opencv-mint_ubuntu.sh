#!/bin/bash

# OpenCV 3.x - installation script For Linux Ubuntu 14.04.2 LTS (Trusty Tahr) and Mint 17.1 (Rebecca)
# http://opencv.org/

# If the latest version > opencv-3.0.0-rc1 you must change the following variables
LINK="https://github.com/Itseez/opencv/archive/3.0.0-rc1.zip" #link to download opencv
FILE_NAME="opencv-3.0.0-rc1.zip" #Name of the file
FILE_LENGTH=`expr length $FILE_NAME`
FILE_LENGTH=$((FILE_LENGTH-4))
DIRECTORY_NAME=${FILE_NAME%%.zip*} #It's just the FILE_NAME without the .zip

echo " **** Initialization **** "

echo " **** Update and upgrade the system **** "
 
sudo apt-get update
sudo apt-get upgrade

echo " **** Dependencies installation **** "
 
sudo apt-get -y install libopencv-dev build-essential cmake git libgtk2.0-dev pkg-config python-dev python-numpy libdc1394-22 libdc1394-22-dev libjpeg-dev libpng12-dev libtiff4-dev libjasper-dev libavcodec-dev libavformat-dev libswscale-dev libxine-dev libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev libv4l-dev libtbb-dev libqt4-dev libfaac-dev libmp3lame-dev libopencore-amrnb-dev libopencore-amrwb-dev libtheora-dev libvorbis-dev libxvidcore-dev x264 v4l-utils unzip qt-creator
 
# Define a constant
FOLDER_NAME="opencv"
 
# Create a new directory with the constant name
mkdir ${FOLDER_NAME}
 
# Enter in the directory
cd ${FOLDER_NAME}
 
# Download opencv 3.x.
wget ${LINK} -O ${FILE_NAME}
 
# Extract the zip file
unzip ${FILE_NAME}

echo " **** Installation of OpenCV 3.x **** "
 
# Enter to the directory
cd ${DIRECTORY_NAME}
 
# Create a new directory called 'build'
mkdir build
 
# Enter in the directory
cd build
 
# Use cmake to create a configuration files with configuration flags
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D WITH_TBB=ON -D BUILD_NEW_PYTHON_SUPPORT=ON -D WITH_V4L=ON -D WITH_QT=ON -D WITH_OPENGL=ON ..
 
# Project compilation
make -j $(nproc)
 
# OpenCV installation
sudo make install
 
# Adds the path of OpenCV libraries to the standard library search paths
sudo /bin/bash -c 'echo "/usr/local/lib" > /etc/ld.so.conf.d/opencv.conf'
 
#  Use ldconfig to dynamically link to an OpenCV library
sudo ldconfig
 
echo " **** OpenCV 3.x was successfuly installed ! ****"
