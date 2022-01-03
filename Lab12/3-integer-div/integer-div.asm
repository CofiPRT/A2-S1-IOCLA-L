section .data
    n1    dd 2512
    n2    dd 41
    print_format db "n1/n2=%f", 10, 0

section .text
    global main

extern printf

main:
    ; TODO: incarca deimpartitul pe stiva FPU (incarcare ca intreg)
    fild DWORD [n2]

    ; TODO: impartire intreaga la impartitor
    fidivr DWORD [n1]

    ; TODO: afisare rezultat
    sub esp, 8
    fstp QWORD [esp]

    push print_format
    call printf
    add esp, 12

    xor eax, eax
    ret
