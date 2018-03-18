#!/bin/sh
sudo apt-get install -y build-essential cmake pkg-config libusb-1.0-0-dev
sudo apt-get install -y libjpeg-dev libtiff5-dev libjasper-dev libpng12-dev
sudo apt-get install -y libavcodec-dev libavformat-dev libswscale-dev libv4l-dev
sudo apt-get install -y libxvidcore-dev libx264-dev
sudo apt-get install -y libgtk2.0-dev libgtk-3-dev
sudo apt-get install -y libcanberra-gtk*
sudo apt-get install -y libatlas-base-dev gfortran
sudo apt-get install -y python2.7-dev python3-dev

cd ~/workspace/
mkdir opencv
curl -L https://github.com/opencv/opencv/archive/3.3.0.tar.gz | tar xz -C opencv --strip-components 1
mkdir opencv_contrib
curl -L https://github.com/opencv/opencv_contrib/archive/3.3.0.tar.gz | tar xz -C opencv_contrib --strip-components 1

cd ~/workspace/opencv/
mkdir build
cd build
cmake -D CMAKE_BUILD_TYPE=RELEASE \
 -D CMAKE_INSTALL_PREFIX=/usr/local \
 -D OPENCV_EXTRA_MODULES_PATH=~/opencv_contrib/modules \
 -D ENABLE_NEON=ON \
 -D ENABLE_VFPV3=ON \
 -D BUILD_TESTS=OFF \
 -D INSTALL_PYTHON_EXAMPLES=OFF \
 -D BUILD_EXAMPLES=OFF ..
make -j4
sudo make install
#cd /usr/local/lib/python3.5/site-packages/
#sudo mv cv2.cpython-35m-arm-linux-gnueabihf.so cv2.so

# Tensorflow install
wget https://github.com/lhelontra/tensorflow-on-arm/releases/download/v1.4.0/tensorflow-1.4.0-cp35-none-linux_armv7l.whl
sudo pip3 install tensorflow-1.4.0-cp35-none-linux_armv7l.whl
rm tensorflow-1.4.0-cp35-none-linux_armv7l.whl
sudo ldconfig
