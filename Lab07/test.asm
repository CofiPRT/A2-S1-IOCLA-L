%include "io.inc"

section .text
global CMAIN

CMAIN:
    ;write your code here
    push ebp
    mov ebp, esp
    
    mov eax, -8406
    mov ebx, 10
    
divide_loop:
    cmp eax, 0
    je exit_loop
    
    cdq
    idiv ebx
    
    test edx, edx
    jns not_signed
    not edx
    inc edx
    
    
not_signed:
    PRINT_DEC 4, edx
    NEWLINE
    
    jmp divide_loop

exit_loop:
    
    xor eax, eax
    
    leave
    ret