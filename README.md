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

To run SSD_MobileNet example

```bash
cd ~/workspace/ncappzoo/caffe/SSD_MobileNet
make run
```

## Post-installation

- If the setup does not return any errors, you have 4.7 GB left (on a 16GB SD Card)
```bash
$ df -h
Filesystem      Size  Used Avail Use% Mounted on
/dev/root        14G  11G  1.6G  88% /
```

- Remove all compiled examples to reclaim some space
```bash
cd ~/workspace
rm -rf ncsdk/examples
$ df -h
Filesystem      Size  Used Avail Use% Mounted on
/dev/root        14G  10G  2.5G  81% /
```

- Remove opencv folders to reclaim more space
```bash
cd ~/workspace
rm -rf opencv
rm -rf opencv_contrib
```

## Camera

### Connect a camera and make sure that it works [Source](https://thepihut.com/blogs/raspberry-pi-tutorials/16021420-how-to-install-use-the-raspberry-pi-camera)

- Run `sudo raspi-config`, enable camera then reboot.
- To take a photo, run `raspistill -o image.jpg`
- To record a 10-second video, run `raspivid -o video.h264 -t 10000`
- To [use camera with python and opencv](https://www.pyimagesearch.com/2015/03/30/accessing-the-raspberry-pi-camera-with-opencv-and-python/)

### Run tiny_yolo or ssd with the camera

[Source](https://www.pyimagesearch.com/2018/02/19/real-time-object-detection-on-the-raspberry-pi-with-the-movidius-ncs/), but start from `Object detection with the Intel Movidius Neural Compute Stick`, ignore all previous sections.

## TODO

- [ ] Add log file => know where to resume in case of unexpected crash
