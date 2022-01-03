extern printf

section .data
	format db "rcx: %u", 13, 10, 0

section .text

global get_max

get_max:
	push rbp
	mov rbp, rsp

	; rdi is array pointer
	; rsi is array length
	
	mov rbx, rdi
	mov rcx, rsi
	xor rax, rax

	mov rdi, format
	call printf

compare:
	cmp rax, QWORD [rbx+rcx*8-8]
	jge check_end
	mov rax, QWORD [rbx+rcx*8-8]
check_end:
	loopnz compare

	leave
	ret
