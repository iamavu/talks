.global _start
.intel_syntax

.section .text

_start:
    push 0x0a414141
    mov %eax, 4
    mov %ebx, 1
    mov %ecx, %esp
    mov %edx, 4

    int 0x80
    mov %eax, 1
    mov %ebx, 0
    int 0x80
.section .data
    msg:
    .ascii ""
