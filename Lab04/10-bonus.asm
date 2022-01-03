%include "io.inc"

section .data
    myArray dw 32, 421, 34, 59, 42, 537, 94, 36, 59, 46
    ARRAY_SIZE db 10

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    
    xor ebx, ebx ; nr de numere pare
    xor esi, esi
    mov si, 2
    mov ecx, [ARRAY_SIZE]
    
start_loop:
    xor eax, eax
    xor edx, edx
    mov ax, word [myArray + 2*(ecx - 1)]
    div si
    
    cmp ah, 0
    jne odd
    inc ebx
odd:
    loop start_loop
    
    PRINT_STRING "Numarul numerelor pare: "
    PRINT_UDEC 4, ebx
    NEWLINE
    
    xor eax, eax
    ret