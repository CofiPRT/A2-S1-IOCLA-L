extern printf

section .data
    n    dq 421.9461
    print_format1 db "Partea intreaga: %d", 10, 0
    print_format2 db "Partea fractionara: %f", 10, 0

section .text
global main
main:

    ; TODO Incarca numarul pe stiva FPU.
    fld QWORD [n]

    ; TODO Foloseste instructiunea fisttp pentru a salva valoarea
    ; cu trunchiere la intreg.
    sub esp, 4
    fisttp DWORD [esp]

    ; TODO Afiseaza partea intreaga.
    push print_format1
    call printf
    add esp, 4

    ; TODO Reincarca numarul pe stiva FPU.
    fld QWORD [n]

    ; TODO Foloseste instructiunea fisub pentru a scadea din n (varful
    ; stivei FPU) partea intreaga obtinuta anterior.
    fisub DWORD [esp]

    ; TODO Extrage partea fractionara si afiseaza rezultatul
    sub esp, 4
    fstp QWORD [esp]

    push print_format2
    call printf
    add esp, 12

    xor eax, eax
    ret
