%include "io.inc"

%define NUM_FIBO 10

section .text
global CMAIN
CMAIN:
    mov ebp, esp

    ; TODO - replace below instruction with the algorithm for the Fibonacci sequence
    mov ecx, NUM_FIBO
    sub esp, NUM_FIBO * 4
    mov DWORD [esp + (ecx - 1) * 4], 0
    mov DWORD [esp + (ecx - 2) * 4], 1
    
    sub ecx, 2
start_loop:
    mov eax, [esp + (ecx - 1 + 1) * 4]
    add eax, [esp + (ecx - 1 + 2) * 4]
    mov [esp + (ecx - 1) * 4], eax
    
    loop start_loop

    mov ecx, NUM_FIBO
print:
    PRINT_UDEC 4, [esp + (ecx - 1) * 4]
    PRINT_STRING " "
    dec ecx
    cmp ecx, 0
    ja print

    mov esp, ebp
    xor eax, eax
    ret
