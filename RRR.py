import RPi.GPIO as GPIO
import time
import signal
import sys
import pygame

# use Raspberry Pi board pin numbers
GPIO.setmode(GPIO.BCM)

#Initailizing Vars 
newDistance = 0 
armed = True
distanceDiff = 0 
# set GPIO Pins
pinTrigger_o = 2
pinEcho_o = 3

pinTrigger_t = 27
pinEcho_t = 22


pinTrigger_h = 9
pinEcho_h = 11

def close(signal, frame):
    print("\nTurning off ultrasonic distance detection...\n")
    GPIO.cleanup() 
    sys.exit(0)

signal.signal(signal.SIGINT, close)

# set GPIO input and output channels
GPIO.setup(pinTrigger_o, GPIO.OUT)
GPIO.setup(pinEcho_o, GPIO.IN)
GPIO.setup(pinTrigger_t, GPIO.OUT)
GPIO.setup(pinEcho_t, GPIO.IN)
GPIO.setup(pinTrigger_h, GPIO.OUT)
GPIO.setup(pinEcho_h, GPIO.IN)

while True:

    startTime = time.time()
    
    # set Trigger to HIGH
    GPIO.output(pinTrigger_o, True)
    GPIO.output(pinTrigger_t, True)
    GPIO.output(pinTrigger_h, True)
    # set Trigger after 0.01ms to LOW
    time.sleep(0.00001)
    GPIO.output(pinTrigger_o, False)
    GPIO.output(pinTrigger_t, False)
    GPIO.output(pinTrigger_h, False)

    # save start time
    while 0 == GPIO.input(pinEcho_o):
        startTime = time.time()

    # save time of arrival
    while 1 == GPIO.input(pinEcho_o):
        stopTime = time.time()
    
    stopTime = time.time()

    # time difference between start and arrival
    TimeElapsed = stopTime - startTime
    # multiply with the sonic speed (34300 cm/s)
    # and divide by 2, because there and back
    distance = (TimeElapsed * 34300) / 2
    
    if (distance != newDistance):
        if armed == True: 
            pygame.mixer.init()
            w
        if armed == False:
            if distance > newDistance:
                newDistance = distance
                distanceDiff = newDistance - distance 
                if distanceDiff >= 5: 
                    print("One Cup Taken") 
                if distanceDiff >= 10:
                    print("Two Cups Taken") 
                if distanceDiff >= 15:
                    print("Three Cups Taken") 
    
        
"""
    if distance <= 25: 
        pygame.mixer.init()
        warning = pygame.mixer.Sound("warning.wav")
        warning.play()
        
"""

    print ("Distance: %.1f cm" % distance)
    time.sleep(1)