extern printf

section .data
    valoare_sin dq 0.123
    max    dq   1.57079632679
    min    dq   0.0
    eroare dq   0.0005

    med    dq   0.0
    format db   "Unghi gasit: %.20f", 10, 0

    sin    dq   0.0

section .text
global main
main:

repeat:
    ; med = (max + min) / 2
    push DWORD 2
    fld qword [max] ; fstack: max
    fadd qword [min]
    fidiv dword [esp]
    fst qword [med] ; fstack: med
    add esp, 4

    ; TODO sin(med) - valoarea med este deja pe stiva
    fsin

    ; TODO stocare rezultat in variabila sin
    fst QWORD [sin] ; fstack: sin

    ; TODO comparatie cu valaorea cautata (valoare_sin)
    fld QWORD [valoare_sin] ; fstack: sin | valoare_sin
    fcomi

    ; TODO ajustare interval in functie de rezultatul comparatiei (min=med sau max=med)

    jbe sin_lower

    fld QWORD [med]
    fstp QWORD [min]
    jmp end_comparison

sin_lower:
    fld QWORD [med]
    fstp QWORD [max]

end_comparison: ; fstack: sin | valoare_sin
    ; TODO verificare eroare (abs(valoare_sin-sin) < eroare)
    fsub
    fabs

    fld QWORD [eroare] ; abs | eroare
    fcomip
    fstp st0

    ; TODO loop daca eroarea este mai mare decat cea maxima
    jbe repeat

    ; TODO afisare rezultat. Valoarea trebuie sa fie aproximativ 0.123312275
    push DWORD [sin + 4]
    push DWORD [sin]
    push format
    call printf
    add esp, 12

    xor eax, eax
    ret
