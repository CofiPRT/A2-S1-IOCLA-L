%include "io.inc"
extern printf

section .data
    before_format db "before %s", 13, 10, 0
    after_format db "after %s", 13, 10, 0
    mystring db "abcdefghij", 0

section .text
global CMAIN

toupper:
    push ebp
    mov ebp, esp

    ; TODO
    mov eax, [esp + 8]
    
start_loop:
    mov byte bl, [eax]
    test bl, bl
    je end_loop
    cmp bl, 'a'
    jl not_lowercase
    cmp bl, 'z'
    jg not_lowercase
    sub byte bl, 0x20
    mov byte [eax], bl
not_lowercase:
    inc eax
    jmp start_loop
end_loop:

    leave
    ret

CMAIN:
    push ebp
    mov ebp, esp

    push mystring
    push before_format
    call printf
    add esp, 8

    push mystring
    call toupper
    add esp, 4

    push mystring
    push after_format
    call printf
    add esp, 8

    leave
    ret
