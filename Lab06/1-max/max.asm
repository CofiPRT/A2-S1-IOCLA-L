%include "io.inc"

section .text
global CMAIN
CMAIN:
    ; cele doua numere se gasesc in eax si ebx
    mov eax, 4
    mov ebx, 14

    ; TODO: aflati maximul folosind doar o instructiune de salt si push/pop
    
    cmp eax, ebx
    jge everything_is_AIGHT
    
    push eax
    mov eax, ebx
    pop ebx
    ; push eax
    ; push ebx
    ; pop eax
    ; pop ebx
    
everything_is_AIGHT:

    PRINT_DEC 4, eax ; afiseaza maximul
    NEWLINE

    ret
