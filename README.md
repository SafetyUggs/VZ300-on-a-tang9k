# VZ300 on a tang9k

The Tang 9k nano board USB is a composite device. It is both
a JTAG programmer, and USB Serial port. Use a terminal program with this
USB serial port to type on your VZ. 115200bps, 1 stop bit, no parity. 

Z80 clock is currently 3.57mhz (derived from the 250mhz HDMI clock).
The real VZ300 is 3.54mhz. The Z80 appears to runs fine at 3-4x this 
speed. V-Blank interrupt is ~59.9hz. 

VDP supports mode 0 and mode 1.

To do: Move VZROM and VZDOS to user flash to free up more SRAM, SD card 
support, VZDOS, Disk Drive Emulation, German Graphics Mod

 
