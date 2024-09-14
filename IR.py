import serial
import time

# Define the serial port and baud rate
ser = serial.Serial('COM3', 9600, timeout=1)  # Change '/dev/ttyUSB0' to the appropriate serial port on your system
while True:
    ser.reset_input_buffer()
    time.sleep(1)
    ser.flush()
    data = ser.readline().decode('utf-8').rstrip()

    print(data)

