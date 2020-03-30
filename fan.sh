#!/usr/bin/python
import time

while True:
    fo = open("/sys/class/thermal/thermal_zone0/temp","r")
    thermal = int(fo.read(10))
    mode=0
    pwm=50 #default
    fo.close()

#    print thermal

    thermal = thermal / 1000
    if thermal < 40:
        mode = 0
	pwm = 80
    elif thermal >= 40 and thermal < 60:
	mode = 1
        pwm = 150
    else:
        mode = 2
        pwm = 255
    
    pwm = str(pwm)
    print ("current temp: " + str(thermal))
    print ("current fan mode: " + str(mode))
    print ("current pwm: " + str(pwm))

    fw=open("/sys/devices/pwm-fan/target_pwm","w")
    fw.write(pwm)
    fw.close()

    time.sleep(10) #print the result for every 10s
