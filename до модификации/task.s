# -4[rbp] - j
# -8[rbp] - counter
# -24[rbp] - array
# -28[rbp] - size
# -40[rbp] - B

	.file	"task.c"
	.intel_syntax noprefix
	.text								# начинаем новую секцию
	.globl	Task
	.type	Task, @function
Task:
	endbr64
	push	rbp
	mov	rbp, rsp
	mov	QWORD PTR -24[rbp], rdi			# запись rdi в array на позиции -24
	mov	DWORD PTR -28[rbp], esi			# запись esi в array на позиции -28
	mov	QWORD PTR -40[rbp], rdx			# запись rdx в B на позиции -40
	mov	DWORD PTR -8[rbp], 0			# запись 0 в counter на позиции -8
	mov	DWORD PTR -4[rbp], 0			# запись 0 в j на позиции -4
	jmp	.L2
.L4:
	mov	eax, DWORD PTR -4[rbp]			# запись j в eax на позиции -4
	cdqe
	lea	rdx, 0[0+rax*4]					# запись смещения в байтах на j в rdx
	mov	rax, QWORD PTR -24[rbp]			# запись &array[0] в rax
	add	rax, rdx
	mov	eax, DWORD PTR [rax]			# кладем значение командной строки в rax
	test	eax, eax
	jle	.L3
	mov	eax, DWORD PTR -4[rbp]			# запись j в eax на позиции -4
	cdqe
	lea	rdx, 0[0+rax*4]					# запись смещения в байтах на j в rdx
	mov	rax, QWORD PTR -24[rbp]			# запись &array[0] в rax
	add	rax, rdx
	mov	edx, DWORD PTR -8[rbp]			# запись counter в edx
	movsx	rdx, edx
	lea	rcx, 0[0+rdx*4]					# запись смещения в байтах на j в rdx
	mov	rdx, QWORD PTR -40[rbp]			# запись &B[0] в rdx
	add	rdx, rcx
	mov	eax, DWORD PTR [rax]			# кладем значение командной строки в rax
	mov	DWORD PTR [rdx], eax			# кладем rax в значение командной строки
	add	DWORD PTR -8[rbp], 1			# смещение counter на 1 позицию
.L3:
	add	DWORD PTR -4[rbp], 1			# смещение j на 1 позицию
.L2:
	mov	eax, DWORD PTR -4[rbp]			# запись j в eax на позиции -4
	cmp	eax, DWORD PTR -28[rbp]			# запись size в eax на позиции -28
	jl	.L4
	mov	eax, DWORD PTR -8[rbp]			# запись counter в eax на позиции -8
	pop	rbp
	ret									# выйти
	.size	Task, .-Task
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
