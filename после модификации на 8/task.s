# r11d - j
# r12d - counter
# -24[rbp] - array
# -28[rbp] - size
# -40[rbp] - B

	.file	"task.c"
	.intel_syntax noprefix
	.text								# начинаем новую секцию
	.globl	Task
	.type	Task, @function
Task:
	push	rbp
	mov	rbp, rsp
	mov	QWORD PTR -24[rbp], rdi			# запись rdi в array на позиции -24
	mov	DWORD PTR -28[rbp], esi			# запись esi в array на позиции -28
	mov	QWORD PTR -40[rbp], rdx			# запись rdx в B в регистр r11d
	mov r12d, 0							# запись 0 в counter в регистр r12d
	mov	DWORD PTR -8[rbp], 0			# запись 0 в counter на позиции -8
	mov	r11d, 0			# запись 0 в j в регистр r11d
	jmp	.L2
.L4:
	mov	eax, r11d			# запись j в eax в регистр r11d
	lea	rdx, 0[0+rax*4]					# запись смещения в байтах на j в rdx
	mov	rax, QWORD PTR -24[rbp]			# запись &array[0] в rax
	add	rax, rdx
	mov	eax, DWORD PTR [rax]			# кладем значение командной строки в rax
	test	eax, eax
	jle	.L3
	mov	eax, r11d			# запись j в eax в регистр r11d
	lea	rdx, 0[0+rax*4]					# запись смещения в байтах на j в rdx
	mov	rax, QWORD PTR -24[rbp]			# запись &array[0] в rax
	add	rax, rdx
	mov edx, r12d						# запись counter в edx в регистр r12d
	mov	edx, DWORD PTR -8[rbp]			# запись counter в edx
	movsx	rdx, edx
	lea	rcx, 0[0+rdx*4]					# запись смещения в байтах на j в rdx
	mov	rdx, QWORD PTR -40[rbp]			# запись &B[0] в rdx
	add	rdx, rcx
	mov	eax, DWORD PTR [rax]			# кладем значение командной строки в rax
	mov	DWORD PTR [rdx], eax			# кладем rax в значение командной строки
	mov r12d, 1							# запись 1 в counter в регистр r12d
	add	DWORD PTR -8[rbp], 1			# смещение counter на 1 позицию
.L3:
	add	r11d, 1			# смещение j на 1 позицию
.L2:
	mov	eax, r11d			# запись j в eax в регистр r11d
	cmp	eax, DWORD PTR -28[rbp]			# запись size в eax на позиции -28
	jl	.L4
	mov eax, r12d						# запись counter в eax в регистр r12d
	mov	eax, DWORD PTR -8[rbp]			# запись counter в eax на позиции -8
	pop	rbp
	ret									# выйти
	
