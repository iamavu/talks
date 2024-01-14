.LC0:
        .string "hello, friend"  ; Defines a null-terminated string with the content "hello, friend"

main:
        push    rbp               ; Save the current value of the base pointer (rbp) onto the stack
        mov     rbp, rsp           ; Set the base pointer (rbp) to the current stack pointer (rsp)

        mov     edi, OFFSET FLAT:.LC0  ; Load the address of the string "hello, friend" into the edi register
        mov     eax, 0              ; Set eax register to 0 (used for the printf function)
        call    printf             ; Call the printf function with the address of the string as an argument

        mov     eax, 0              ; Set eax register to 0 (usually used for return values)
        pop     rbp                ; Restore the previous value of the base pointer from the stack
        ret                         ; Return from the main function