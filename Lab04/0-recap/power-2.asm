%include "io.inc"

section .text
global CMAIN
CMAIN:
    push ebp
    mov ebp, esp

    mov eax, 211    ; to be broken down into powers of 2
    mov ebx, 1      ; stores the current power

    ; TODO - print the powers of 2 that generate number stored in EAX
    
    
start_loop:
    cmp eax, ebx
    jl end_loop
    
    test eax, ebx
    jz nope
    PRINT_DEC 4, ebx
    NEWLINE
nope:
    shl ebx, 1
    jmp start_loop
end_loop:
    
    leave
    ret
