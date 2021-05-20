CC=arm-none-eabi-gcc
MACH=cortex-m4
COMMONFLGS= -mcpu=$(MACH) -mthumb -mfloat-abi=soft
CFLAGS= -c $(COMMONFLGS) -std=gnu11 -O0 -Wall
LINKERFILENAME = stm32Linker.ld
LFLAGS= $(COMMONFLGS) --specs=nano.specs -T $(LINKERFILENAME) -Wl,-Map=final.map
LFLAGS_SH= $(COMMONFLGS) --specs=rdimon.specs -T $(LINKERFILENAME) -Wl,-Map=final.map



all: main.o led.o stm32_startup.o syscalls.o final.elf

semi: main.o led.o stm32_startup.o final_sh.elf

main.o: main.c
				$(CC) $(CFLAGS) $^ -o $@


led.o: led.c
				$(CC) $(CFLAGS) $^ -o $@

stm32_startup.o : stm32_startup.c
				$(CC) $(CFLAGS) $^ -o $@

final.elf: main.o led.o stm32_startup.o syscalls.o
			  $(CC) $(LFLAGS) $^ -o $@

final_sh.elf: main.o led.o stm32_startup.o
			  $(CC) $(LFLAGS_SH) $^ -o $@

syscalls.o: syscalls.c
				$(CC) $(CFLAGS) $^ -o $@

load:
		openocd -f stm32f4discovery.cfg

clean:
			rm *.o *.elf *map
