.global _start
.intel_syntax

.section .text

_start:
    mov %eax, 4
    mov %ebx, 1
    lea %ecx, [msg]
    mov %edx, 14
    int 0x80

    mov %eax, 1
    mov %ebx, 0
    int 0x80

.section .data
    msg:
    .ascii "hello, friend\n"
