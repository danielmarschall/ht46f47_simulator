#!/usr/bin/python3

# HT46F47 TPS micro controller programmer in Python
# by Daniel Marschall
# Revision 23 May 2020
# Licensed under the terms of the Apache 2.0 license

# This script helps you programming the HT46F47 TPS micro controller
# The PINs Reset, S1 and S2 are connected to the collectors of transistors,
# where the emitter is connected to ground and the base is connected to a GPIO pin.
# Therefore, the Raspberry Pi can control the reset, S1 and S2 functionalities
# to automatically program the micro controller.

# Note: If the programming fails, you could try increasing the sleep times.
# The following values did work for me, but for larger programs, there could be
# an asynchronity during the programming.

import RPi.GPIO as GPIO
import time

GPIO_S1  = 13
GPIO_S2  = 19
GPIO_RES = 26

GPIO.setwarnings(False)
GPIO.setmode(GPIO.BCM)
GPIO.setup(GPIO_S1,  GPIO.OUT)
GPIO.setup(GPIO_S2,  GPIO.OUT)
GPIO.setup(GPIO_RES, GPIO.OUT)

def do_exit():
	GPIO.output(GPIO_S1,  GPIO.LOW)
	GPIO.output(GPIO_S2,  GPIO.LOW)
	GPIO.output(GPIO_RES, GPIO.LOW)

def signal_handler(signal, frame):
	do_exit()
	sys.exit(0)

def pressButton(pin):
	# 0.025 ist zu gering... da kommt der controller nicht hinterher
	# 0.050 funktioniert
	GPIO.output(pin, GPIO.HIGH)
	time.sleep(0.050)
	GPIO.output(pin, GPIO.LOW)
	time.sleep(0.050)

def writeCommandDataPair(befehl, daten):
	#time.sleep(0.050) # Sicherheits-Puffer
	time.sleep(0.300)  # Adresse (untere vier Bit) anzeigen, 300ms
	time.sleep(0.300)  # Anzeige aus, 300ms
	#time.sleep(0.050) # Befehl anzeigen (Sicherheits-Puffer)
	pressButton(GPIO_S1)    # Programmiermodus starten
	for dummy in range(0, befehl):
		pressButton(GPIO_S1) # Befehl eingeben
	pressButton(GPIO_S2)    # Weiter zu den Daten
	#time.sleep(0.050) # Daten anzeigen (Sicherheits-Puffer)
	pressButton(GPIO_S1)    # Programmiermodus starten
	for dummy in range(0, daten):
		pressButton(GPIO_S1) # Daten eingeben
	pressButton(GPIO_S2)    # Fortfahren
	time.sleep(0.600)  # Byte einprogrammieren, 600ms
	#time.sleep(0.050) # Sicherheits-Puffer

def writeByte(byte):
	befehl = byte >> 4
	daten = byte & 0xF
	writeCommandDataPair(befehl, daten)

def startProgrammingMode():
	#time.sleep(0.050)  # Sicherheits-Puffer
	GPIO.output(GPIO_S2, GPIO.HIGH);
	pressButton(GPIO_RES)
	time.sleep(0.500)   # "etwa eine halbe Sekunde" (Handbuch Seite 19)
	#time.sleep(0.050)  # Sicherheits-Puffer
	GPIO.output(GPIO_S2, GPIO.LOW);
	#time.sleep(0.050)  # Sicherheits-Puffer

def resetController():
	pressButton(GPIO_RES)

# --------------------------------------------------------------------

startProgrammingMode()

writeByte(0xFF)
writeByte(0xFF)

resetController() # Reset controller to run program

do_exit()
