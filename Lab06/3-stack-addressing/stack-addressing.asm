%include "io.inc"

%define NUM 5

section .text
global CMAIN
CMAIN:
    mov ebp, esp

    ; TODO 1: replace every push by an equivalent sequence of commands
    
    ; pushing an array on the stack
    mov ecx, NUM
push_nums:
    ;push ecx
    sub esp, 4
    mov [esp], ecx
    loop push_nums

    ; pushing a string on the stack
    ;push 0
    sub esp, 1
    mov BYTE [esp], 0
    ;push "bere"
    sub esp, 4
    mov DWORD [esp], "bere"
    ;push "are "
    sub esp, 4
    mov DWORD [esp], "are "
    ;push "Ana "
    sub esp, 4
    mov DWORD [esp], "Ana "

    ; TODO 2: print the stack in "address: value" format in the range of [ESP:EBP]
    ; (from low addresses to high addresses, byte by byte)
    
    mov ecx, esp
        
start_stack_print:
    PRINT_STRING "0x"
    PRINT_HEX 4, ecx
    PRINT_STRING ": "
    PRINT_UDEC 1, [ecx]
    NEWLINE
    
    inc ecx
    cmp ecx, ebp
    jl start_stack_print
   
    ; TODO 3: print the string byte by byte
    
    mov ecx, esp
    mov ebx, ebp
    sub ebx, 20
                    
start_string_print:
    PRINT_CHAR [ecx]
    
    inc ecx
    cmp ecx, ebx
    jl start_string_print
    
    NEWLINE

    ; TODO 4: print the array element by element
    
start_array_print:
    PRINT_UDEC 4, [ecx]
    PRINT_STRING " "
    
    add ecx, 4
    cmp ecx, ebp
    jl start_array_print
    
    NEWLINE

    ; restore the previous value of the EBP (Base Pointer)
    mov esp, ebp

    ; exit without errors
    xor eax, eax
    ret
