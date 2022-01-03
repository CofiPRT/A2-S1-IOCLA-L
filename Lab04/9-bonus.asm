%include "io.inc"

section .data
    myArray dw 490, 521, 120, -521, 240, -123, -1234, -51, 5214, 0
    ARRAY_SIZE db 10

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    mov ecx, [ARRAY_SIZE]
    xor ebx, ebx
    xor edx, edx
    
start_loop:
    mov eax, [myArray + 2*(ecx - 1)]
    
    cmp eax, 0
    jl negative
    inc ebx
    jmp next_loop
negative:
    inc edx
next_loop:
    loop start_loop
    
    PRINT_STRING "Number of positive numbers: "
    PRINT_UDEC 4, ebx
    NEWLINE
    PRINT_STRING "Number of negative numbers: "
    PRINT_UDEC 4,edx
    NEWLINE
    
    
    xor eax, eax
    ret