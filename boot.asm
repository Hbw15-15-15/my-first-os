; Multiboot header for GRUB/Limine compatibility
section .multiboot
    align 4
    dd 0x1BADB002              ; Magic number
    dd 0x00                    ; Flags
    dd -(0x1BADB002 + 0x00)    ; Checksum

section .text
global _start
extern kernel_main

_start:
    ; Set up a stack (the CPU needs this to run C code)
    mov esp, stack_space
    call kernel_main
    hlt

section .bss
resb 8192                      ; 8KB of memory for the stack
stack_space:
