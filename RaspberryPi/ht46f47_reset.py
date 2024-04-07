#!/usr/bin/python

import RPi.GPIO as GPIO
import datetime
import time
import sys
import signal
import os
import subprocess

GPIO_RST = 26

GPIO.setwarnings(False)

GPIO.setmode(GPIO.BCM)

GPIO.setup(GPIO_RST, GPIO.OUT)

def do_exit():
	GPIO.output(GPIO_RST, GPIO.LOW)
	GPIO.cleanup()

def signal_handler(signal, frame):
	do_exit()
	sys.exit(0)
signal.signal(signal.SIGINT, signal_handler)

GPIO.output(GPIO_RST, GPIO.HIGH)
time.sleep(0.1)
GPIO.output(GPIO_RST, GPIO.LOW)

do_exit()
