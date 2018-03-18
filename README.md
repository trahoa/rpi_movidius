# rpi_movidius
Movidius NCSDK on Raspberry Pi 3

## Important:

- The Movidius stick must be plugged during installation
- This will take a looong time to finish, approx 5 hours

## Usage

```bash
git clone https://github.com/trahoa/rpi_movidius.git
cd rpi_movidius
bash setup_all.sh
```

## Post-installation

- If the setup does not return any errors, you have 4.7 GB left (on a 16GB SD Card)
```bash
$ df -h
Filesystem      Size  Used Avail Use% Mounted on
/dev/root        14G  7.7G  4.7G  63% /
```

- Remove all compiled examples to reclaim some space
```bash
cd ~/workspace
rm -rf ncsdk
git clone https://github.com/movidius/ncsdk
$ df -h
Filesystem      Size  Used Avail Use% Mounted on
/dev/root        14G  6.9G  5.5G  56% /
```

- Remove opencv folders to reclaim more space
```bash
cd ~/workspace
rm -rf opencv
rm -rf opencv_contrib
$ df -h
Filesystem      Size  Used Avail Use% Mounted on
/dev/root        14G  6.7G  5.8G  54% /
```

## Camera

### Connect a camera and make sure that it works [Source](https://thepihut.com/blogs/raspberry-pi-tutorials/16021420-how-to-install-use-the-raspberry-pi-camera)

- Run `sudo raspi-config`, enable camera then reboot.
- To take a photo, run `raspistill -o image.jpg`
- To record a 10-second video, run `raspivid -o video.h264 -t 10000`
- Install GStreamer element for the Raspberry Pi camera module ([gst-rpicamsrc](https://github.com/thaytan/gst-rpicamsrc))

```bash
apt-get install -y autoconf automake libtool pkg-config libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libraspberrypi-dev
cd ~/workspace
git clone https://github.com/thaytan/gst-rpicamsrc
cd gst-rpicamsrc
./autogen.sh --prefix=/usr --libdir=/usr/lib/arm-linux-gnueabihf/
make
sudo make install
gst-launch-1.0 rpicamsrc bitrate=1000000 fullscreen=0 ! video/x-h264,width=640,height=480,framerate=25/1 ! filesink location=test.h264
```

### Run tiny_yolo or ssd with the camera

