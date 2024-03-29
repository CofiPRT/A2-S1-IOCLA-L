%include "io.inc"
section .data
    N dd 9 ; compute the sum of the first N fibonacci numbers
    
section .text
global CMAIN
CMAIN:
    push ebp
    mov ebp, esp

    ; TODO: calculate the sum of first N fibonacci numbers
    ;       (f(0) = 0, f(1) = 1)
    ;       store the sum in eax
    ;       use loop instruction 
    
    xor eax, eax
    mov ebx, 0
    mov edx, 1
    mov ecx, dword [N]
    
start_loop:
    add eax, ebx ; add to sum
    
    add edx, ebx ; interchange
    mov esi, edx
    sub esi, ebx
    mov ebx, esi
    
    loop start_loop

    PRINT_STRING "Sum first "
    PRINT_DEC 4, [N]
    PRINT_STRING " fibo is "
    PRINT_UDEC 4, eax

    xor eax, eax
    leave
	ret
