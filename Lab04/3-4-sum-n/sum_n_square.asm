%include "io.inc"

section .data
    num dd 100


section .text
global CMAIN
CMAIN:
    ;push rbp
    mov ebp, esp; for correct debugging
    
    mov eax, 0
    mov ecx, [num]
    
start_loop:
    push eax
    mov eax, ecx
    mul ecx
    mov edx, eax
    
    pop eax
    add eax, edx
    loop start_loop
    
    PRINT_STRING "Rezultatul este: "
    PRINT_DEC 4, eax
    NEWLINE
    
    
    xor eax, eax
    ret