%include "io.inc"

section .text
global CMAIN
CMAIN:
    ;cele doua multimi se gasesc in eax si ebx
    mov eax, 139 
    mov ebx, 169
    PRINT_DEC 4, eax ; afiseaza prima multime
    NEWLINE
    PRINT_DEC 4, ebx ; afiseaza cea de-a doua multime
    NEWLINE

    ; TODO1: reuniunea a doua multimi
    mov ecx, eax
    or ecx, ebx
    
    PRINT_STRING "Reuniune: "
    PRINT_DEC 4, ecx
    NEWLINE
    
    ; TODO2: adaugarea unui element in multime
    or ecx, 256
    
    PRINT_STRING "Adaugare: "
    PRINT_DEC 4, ecx
    NEWLINE
    
    ; TODO3: intersectia a doua multimi
    mov ecx, eax
    and ecx, ebx
    
    PRINT_STRING "Intersectie: "
    PRINT_DEC 4, ecx
    NEWLINE
    
    ; TODO4: complementul unei multimi
    mov ecx, eax
    not ecx
    
    PRINT_STRING "Not: "
    PRINT_DEC 4, ecx
    NEWLINE
    
    ; TODO5: eliminarea unui element
    mov ecx, eax
    mov edx, 1
    shl edx, 2
    not edx
    and ecx, edx
    
    PRINT_STRING "Eleminarea: "
    PRINT_DEC 4, ecx
    NEWLINE
    
    ; TODO6: diferenta dintre doua multimi
    mov ecx, eax
    mov edx, ebx
    not edx
    and ecx, edx
    
    PRINT_STRING "Diferenta: "
    PRINT_DEC 4, ecx
    NEWLINE

    xor eax, eax
    ret
