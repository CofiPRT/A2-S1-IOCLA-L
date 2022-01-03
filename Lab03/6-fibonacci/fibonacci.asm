%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov eax, 7       ; vrem sa aflam al N-lea numar; N = 7
    ; TODO: calculati al N-lea numar fibonacci (f(0) = 0, f(1) = 1)
    mov ecx, 0 ; counter
    mov ebx, 1 ; f(1)
    mov edx, 1 ; f(2)
    
start_loop:
    cmp ecx, eax
    jnl end_loop
    
    add edx, ebx
    mov esi, edx
    sub esi, ebx
    mov ebx, esi
    
    inc ecx
    jmp start_loop
    
end_loop:
    
    PRINT_STRING "Al "
    PRINT_DEC 4, eax
    PRINT_STRING "-lea numar este: "
    PRINT_DEC 4, ebx
    
    xor eax, eax
    ret