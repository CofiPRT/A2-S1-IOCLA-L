%include "io.inc"

section .data
    source_text db "ABCABABCBCBABCBBBABCBBCBABCBAAACCCB", 0
    substring db "BABC", 0

    source_length dd 1
    substr_length dd 4

    print_format db "Substring found at index: ", 0

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    push ebp
    mov ebp, esp

    ; TODO: Fill source_length with the length of the source_text string.
    ; Find the length of the string using scasb.
    mov edi, source_text
    mov al, 0
    repnz scasb
    sub edi, source_text
    dec edi
    mov [source_length], edi

    ; TODO: Print the start indices for all occurrences of the substring in source_text
    mov ecx, 8
    mov edi, source_text
start_loop:
    jcxz end_loop_h1
    
    mov esi, substring
    cmpsd
    jne end_print
    
    jmp continue1
    PRINT_STRING print_format
end_loop_h1:
    jmp end_loop
continue1:
    push edi
    sub edi, 4
    sub edi, source_text
    PRINT_UDEC 4, edi
    NEWLINE
    pop edi
end_print:
    
    dec ecx
    jmp start_loop
end_loop:

    leave
    ret
