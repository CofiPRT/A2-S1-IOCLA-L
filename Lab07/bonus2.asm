%include "io.inc"

extern puts



section .data
    myString db "abCDnoPQ", 0, 10
    myStringArray db "ana", 0, "are", 0, "mere", 0, 10 
    
rot13:
    push ebp
    mov ebp, esp
    
    push eax
    push ebx
    mov eax, [ebp + 8] ; the string
    
start_loop:
    mov byte bl, [eax]
    
    cmp bl, 10
    mov byte [eax], 0
    je end_loop
    
    cmp bl, 0
    jne not_null
    
    mov byte bl, 32
    jmp step_done
    
not_null:
    cmp bl, 'a'
    jl not_lower
    cmp bl, 'z'
    jg not_lower
    
    add bl, 13
    
    cmp bl, 'z'
    jle step_done ; keep in 'a' - 'z'
    
    sub bl, 26
    jmp step_done
    
not_lower:
    cmp bl, 'A'
    jl step_done ; not upper
    cmp bl, 'Z'
    jg step_done ; not upper
    
    add bl, 13
    
    cmp bl, 'Z'
    jle step_done ; keep in 'A' - 'Z'
    
    sub bl, 26

step_done:
    mov byte [eax], bl

    inc eax
    jmp start_loop
    
end_loop:
    pop ebx
    pop eax
    
    leave
    ret

section .text
global CMAIN
CMAIN:
    ;write your code here
    xor eax, eax
    
    push myString
    call rot13
    
    call puts
    add esp, 4
    
    push myStringArray
    call rot13
    
    call puts
    add esp, 4
    
    ret