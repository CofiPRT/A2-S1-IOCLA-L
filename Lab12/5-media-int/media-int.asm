section .data
    vector dd 30, 31, 100, 86, 23, 9, 64, 90, 25, 96
    n      dd ($-vector)/4
    format db "Media elementelor: %f", 10, 0

section .text
    global main

extern printf

main:
    ; incarca valoarea 0 pe stiva FPU
    fldz

    ; TODO: parcurgerea tuturor elementelor si adunare la valoarea din varful stivei FPU (adunare intreaga)

    mov eax, vector
    mov ecx, dword [n]

repeat:
    cmp ecx, 0
    je done

    fiadd DWORD [eax]
    add eax, 4

    dec ecx
    jmp repeat

done:
    ; TODO: impartirea sumei la numarul de elemente (impartire intreaga)
    fidiv DWORD [n]

    ; TODO Afisarea rezultatului
    ; Rezultatul ar trebui sa fie 55.4

    sub esp, 8
    fstp QWORD [esp]

    push format
    call printf
    add esp, 12

    xor eax, eax
    ret
