%include "io.inc"

section .data
    myString: db "Hello, World!",0
    myString2: db "Goodbye, World!",0

section .text
global CMAIN
CMAIN:
    mov ecx, 6                 ; N = valoarea registrului ecx
    mov eax, 2
    mov ebx, 1
    mov edx, 0
    cmp eax, ebx
    jg print                   ; TODO1: eax > ebx?
    ret
print:
    cmp edx, ecx
    je end_print
    
    PRINT_STRING myString
    NEWLINE
    
    inc edx
    jmp print
end_print:
    PRINT_STRING myString2
    NEWLINE
                               ; TODO2.2: afisati "Hello, World!" de N ori
                               ; TODO2.1: afisati "Goodbye, World!"

    ret
