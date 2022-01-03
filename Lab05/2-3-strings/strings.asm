%include "io.inc"

section .data
    string db "Lorem ipsum dolor sit amet.", 0
    print_strlen db "strlen: ", 10, 0
    print_occ db "occurences of `i`:", 10, 0

    occurences dd 0
    length dd 0    
    char db 'i'

section .text
global CMAIN
CMAIN:
    push ebp
    mov ebp, esp

    ; TODO1: compute the length of a string
    mov edi, string
    mov al, 0 ; NULL
    repne scasb

    ; TODO1: save the result in at address length
    sub edi, string
    dec edi
    mov [length], edi

    ; print the result of strlen
    PRINT_STRING print_strlen
    PRINT_UDEC 4, [length]
    NEWLINE

    ; TODO2: compute the number of occurences
    mov ecx, [length]
    mov edi, string
    mov al, BYTE [char]
    xor ebx, ebx ; count
    
start_loop:
    repne scasb
    jcxz end_loop
    inc ebx
    jmp start_loop
end_loop:
    
    ; TODO2: save the result in at address occurences
    mov [occurences], ebx

    ; print the number of occurences of the char
    PRINT_STRING print_occ
    PRINT_UDEC 4, [occurences]
    NEWLINE

    xor eax, eax
    leave
    ret
