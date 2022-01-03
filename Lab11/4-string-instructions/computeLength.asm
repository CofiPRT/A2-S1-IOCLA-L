global computeLength1
global computeLength2

section .text
computeLength1:
	push ebp
	mov ebp, esp
;TODO: Implement byte count using a software loop

	xor edi, edi
	mov ebx, [ebp + 8] ; string address

compute1_loop:
	cmp BYTE [ebx + edi], 0
	je compute1_loop_end

	inc edi
	jmp compute1_loop

compute1_loop_end:
	mov eax, edi

	mov esp, ebp
	pop ebp
	ret

computeLength2:
	push ebp
	mov ebp, esp
;TODO: Implement byte count using a hardware loop

	mov edi, [ebp + 8] ; string address

	xor eax, eax ; 0
	xor ecx, ecx
	not ecx
	cld
	repne scasb
	not ecx
	dec ecx

	mov eax, ecx

	mov esp, ebp
	pop ebp
	ret
