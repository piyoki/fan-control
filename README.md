# fan-control

Control the pwm fan with the change of the CPU temperature of any Jetson Machine (Jetson Nano, Jetson TX1, TX2, Jetson Xavier).
This fan control script has three modes `0 , 1 , 2` and its set to different value of pwm. 

You may modify the `pwm` value associated with the mode in the script.

The default pwm values associated with mode `0 , 1 , 2` are `80, 150 , 255` accordingly

Check out the demo below:

![](demo.png)

## How to use

### Step #1: Download the repository

```bash
$ git clone https://github.com/yqlbu/fan-control/
```

### Step #2: Modified parameters to adjust your needs

```bash
$ cd fan-control
$ vi fan.sh 
```

### Step #3: Set autostart at boot

```bash
$ sudo chmod +x fan.sh
$ sudo scp fan.sh /etc/init.d
$ sudo crontab -e
# add  @reboot /etc/init.d/fan.sh  at the very top lane \
$ sudo reboot
```

### (Optional) Install Jetson-Stat to constantly monitor the temperature changes

The installation required `python and pip` pre-installed in the system, if you have not done so, do the following:

```bash
$ sudo apt-get install -y python3-pip python3-dev python3-setuptools
$ pip3 --version
```

Installation

```bash
$ sudo -H pip3 install -U jetson-stats
$ sudo jtop
```

