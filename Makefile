# Build Tools
CC = gcc
AS = nasm
LD = ld

# Flags
CFLAGS = -m32 -c -ffreestanding -O2 -Wall -Wextra
LDFLAGS = -m elf_i386 -T linker.ld
ASFLAGS = -f elf32

all: myos.bin

myos.bin: boot.o kernel.o
	$(LD) $(LDFLAGS) boot.o kernel.o -o myos.bin

boot.o: boot.asm
	$(AS) $(ASFLAGS) boot.asm -o boot.o

kernel.o: kernel.c
	$(CC) $(CFLAGS) kernel.c -o kernel.o

clean:
	rm -f *.o myos.bin
