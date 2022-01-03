extern printf
global main

section .data
    str: db "Clock ticks: %d", 10, 13

section .text
main:
    push ebp
    mov ebp, esp

    mov ecx, 1000
    xor eax, eax

    ; TODO:
    ; 1. call rdtsc
    ; 2. save the the value from eax to another register
    ; 3. implement the loop using loop, then a jump instruction
    ; 4. call rdtsc again
    ; 5. subtract from eax the former value of eax

    rdtsc
    push eax

start_loop:
    loop start_loop

    rdtsc
    pop ebx
    sub eax, ebx

    push eax
    push str
    call printf
    add esp, 8

    xor eax, eax
    rdtsc
    push eax

    mov ecx, 1000

start_loop_jmp:
    dec ecx
    cmp ecx, 0
    jg start_loop_jmp

    rdtsc
    pop ebx
    sub eax, ebx

    push eax
    push str
    call printf
    add esp, 8


    mov esp, ebp
    pop ebp
    ret
