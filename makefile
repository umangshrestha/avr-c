# variables \
make sure no spaces are there \
after filename expeciall after file_name
CC = avr-gcc 
BAUD_RATE = 115200
PORT = /dev/ttyACM0
BIN = ./bin
CLOCK_SPEED = 16000000UL
FILE_NAME = fading-led
CODE_PATH = ./src

install:
	${CC} -Os -DF_CPU=${CLOCK_SPEED} -mmcu=atmega328p -c -o ${BIN}/${FILE_NAME}.o ${CODE_PATH}/${FILE_NAME}.c
	${CC} -mmcu=atmega328p ${BIN}/${FILE_NAME}.o -o ${BIN}/${FILE_NAME}
	avr-objcopy -O ihex -R .eeprom ${BIN}/${FILE_NAME} ${BIN}/${FILE_NAME}.hex
	avrdude -F -V -c arduino -p ATMEGA328P -P ${PORT} -b ${BAUD_RATE} -U flash:w:${BIN}/${FILE_NAME}.hex
installp:
# install the dependencies required for avt \
dont know if it should be in make file but \
its easier for future refrence
	sudo apt-get install gcc-avr binutils-avr avr-libc avrdude
backup:
	avrdude -F -V -c arduino -p ATMEGA328P -P ${PORT} -b ${BAUD_RATE} -U flash:r:flash_backup.hex:i
make clean:
	rm ${BIN}/* 

