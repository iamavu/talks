reverseString:
        push    rbp                  ; Save the base pointer
        mov     rbp, rsp             ; Set up the base pointer
        sub     rsp, 32              ; Allocate space on the stack for local variables
        mov     QWORD PTR [rbp-24], rdi  ; Store the input string pointer in a local variable
        mov     rax, QWORD PTR [rbp-24]  ; Load the input string pointer into rax
        mov     rdi, rax             ; Set rdi to the input string pointer
        call    strlen               ; Call the strlen function to get the length of the string
        mov     DWORD PTR [rbp-12], eax  ; Store the length of the string in a local variable
        mov     DWORD PTR [rbp-4], 0  ; Initialize a counter (loop variable) to 0
        mov     eax, DWORD PTR [rbp-12]  ; Load the length of the string into eax
        sub     eax, 1               ; Subtract 1 to get the last index of the string
        mov     DWORD PTR [rbp-8], eax   ; Store the last index in a local variable
        jmp     .L2                  ; Jump to the beginning of the loop

.L3:
        ; Inside the loop
        mov     eax, DWORD PTR [rbp-4]   ; Load the counter into eax
        movsx   rdx, eax             ; Sign-extend the counter to rdx
        mov     rax, QWORD PTR [rbp-24]  ; Load the input string pointer into rax
        add     rax, rdx             ; Move the pointer to the current character
        movzx   eax, BYTE PTR [rax]  ; Load the current character into eax
        mov     BYTE PTR [rbp-13], al   ; Store the current character in a temporary variable

        ; Swap characters in the reversed string
        mov     eax, DWORD PTR [rbp-8]   ; Load the last index into eax
        movsx   rdx, eax             ; Sign-extend the last index to rdx
        mov     rax, QWORD PTR [rbp-24]  ; Load the input string pointer into rax
        add     rax, rdx             ; Move the pointer to the character to be swapped
        mov     edx, DWORD PTR [rbp-4]   ; Load the counter into edx
        movsx   rcx, edx             ; Sign-extend the counter to rcx
        mov     rdx, QWORD PTR [rbp-24]  ; Load the input string pointer into rdx
        add     rdx, rcx             ; Move the pointer to the character to be swapped
        movzx   eax, BYTE PTR [rax]  ; Load the character to be swapped into eax
        mov     BYTE PTR [rdx], al   ; Swap characters
        mov     eax, DWORD PTR [rbp-8]   ; Load the last index into eax
        movsx   rdx, eax             ; Sign-extend the last index to rdx
        mov     rax, QWORD PTR [rbp-24]  ; Load the input string pointer into rax
        add     rdx, rax             ; Move the pointer to the character to be swapped back
        movzx   eax, BYTE PTR [rbp-13]  ; Load the stored character into eax
        mov     BYTE PTR [rdx], al   ; Swap characters back

        ; Update counters
        add     DWORD PTR [rbp-4], 1   ; Increment the counter
        sub     DWORD PTR [rbp-8], 1   ; Decrement the last index

.L2:
        ; Loop condition check
        mov     eax, DWORD PTR [rbp-4]   ; Load the counter into eax
        cmp     eax, DWORD PTR [rbp-8]   ; Compare the counter with the last index
        jl      .L3                  ; Jump back to the loop if counter < last index

        nop                           ; No operation (placeholder)
        nop                           ; No operation (placeholder)

        leave                        ; Release the stack frame
        ret                          ; Return from the function

.LC0:
        .string "enter passcode, friend: "
.LC1:
        .string "%[^\n]s"
.LC2:
        .string "i am root"
.LC3:
        .string "shucks, no more rm -rf :sadPepe:"
.LC4:
        .string "pfft, time to rm -rf the world"

main:
        push    rbp                  ; Save the base pointer
        mov     rbp, rsp             ; Set up the base pointer
        sub     rsp, 112             ; Allocate space on the stack for local variables
        mov     edi, OFFSET FLAT:.LC0  ; Load the address of the format string for printf
        mov     eax, 0               ; Clear eax
        call    printf               ; Call printf to print the prompt
        lea     rax, [rbp-112]       ; Load the address of the buffer for input
        mov     rsi, rax             ; Set rsi to the address of the buffer
        mov     edi, OFFSET FLAT:.LC1  ; Load the address of the format string for scanf
        mov     eax, 0               ; Clear eax
        call    __isoc99_scanf       ; Call scanf to read input

        lea     rax, [rbp-112]       ; Load the address of the buffer for input
        mov     rdi, rax             ; Set rdi to the address of the buffer
        call    reverseString        ; Call the reverseString function

        lea     rax, [rbp-112]       ; Load the address of the buffer for input
        mov     esi, OFFSET FLAT:.LC2  ; Load the address of the correct passcode
        mov     rdi, rax             ; Set rdi to the address of the buffer
        call    strcmp               ; Call strcmp to compare the reversed string with the correct passcode
        test    eax, eax             ; Test the result of the comparison
        jne     .L5                  ; Jump to .L5 if the strings are not equal

        mov     edi, OFFSET FLAT:.LC3  ; Load the address of the success message
        call    puts                 ; Call puts to print the success message
        jmp     .L6                  ; Jump to .L6

.L5:
        mov     edi, OFFSET FLAT:.LC4  ; Load the address of the failure message
        call    puts                 ; Call puts to print the failure message

.L6:
        mov     eax, 0               ; Set the return value to 0
        leave                        ; Release the stack frame
        ret                          ; Return from the main function