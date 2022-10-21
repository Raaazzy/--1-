	.file	"main.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
	.align 8
.LC0:
	.string	"Input length (0 < length <= %d): "
.LC1:
	.string	"%d"
.LC2:
	.string	"Incorrect length = %d\n"
.LC3:
	.string	"Input A[%d]: "
.LC4:
	.string	"Result: "
.LC5:
	.string	"%d "
.LC6:
	.string	"r"
.LC7:
	.string	"input.txt"
.LC8:
	.string	"w"
.LC9:
	.string	"output.txt"
.LC10:
	.string	"Length of array A: %d \n"
.LC11:
	.string	"Array A: "
	.text
	.globl	main
	.type	main, @function
main:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 352
	mov	DWORD PTR -340[rbp], edi
	mov	QWORD PTR -352[rbp], rsi
	cmp	DWORD PTR -340[rbp], 2
	jne	.L2
	mov	rax, QWORD PTR -352[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	atoi@PLT
	cmp	eax, 1
	jne	.L2
	mov	rax, QWORD PTR -352[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	atoi@PLT
	mov	DWORD PTR -292[rbp], eax
	mov	esi, 30
	lea	rdi, .LC0[rip]
	mov	eax, 0
	call	printf@PLT
	lea	rax, -292[rbp]
	mov	rsi, rax
	lea	rdi, .LC1[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT
	mov	eax, DWORD PTR -292[rbp]
	test	eax, eax
	jle	.L3
	mov	eax, DWORD PTR -292[rbp]
	cmp	eax, 30
	jle	.L4
.L3:
	mov	eax, DWORD PTR -292[rbp]
	mov	esi, eax
	lea	rdi, .LC2[rip]
	mov	eax, 0
	call	printf@PLT
	mov	eax, 1
	jmp	.L25
.L4:
	mov	DWORD PTR -4[rbp], 0
	jmp	.L6
.L7:
	mov	eax, DWORD PTR -4[rbp]
	mov	esi, eax
	lea	rdi, .LC3[rip]
	mov	eax, 0
	call	printf@PLT
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	lea	rax, -160[rbp]
	add	rax, rdx
	mov	rsi, rax
	lea	rdi, .LC1[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT
	add	DWORD PTR -4[rbp], 1
.L6:
	mov	eax, DWORD PTR -292[rbp]
	cmp	DWORD PTR -4[rbp], eax
	jl	.L7
	mov	ecx, DWORD PTR -292[rbp]
	lea	rdx, -288[rbp]
	lea	rax, -160[rbp]
	mov	esi, ecx
	mov	rdi, rax
	call	Task@PLT
	mov	DWORD PTR -16[rbp], eax
	lea	rdi, .LC4[rip]
	mov	eax, 0
	call	printf@PLT
	mov	DWORD PTR -8[rbp], 0
	jmp	.L8
.L9:
	mov	eax, DWORD PTR -8[rbp]
	cdqe
	mov	eax, DWORD PTR -288[rbp+rax*4]
	mov	esi, eax
	lea	rdi, .LC5[rip]
	mov	eax, 0
	call	printf@PLT
	add	DWORD PTR -8[rbp], 1
.L8:
	mov	eax, DWORD PTR -8[rbp]
	cmp	eax, DWORD PTR -16[rbp]
	jl	.L9
	mov	edi, 10
	call	putchar@PLT
	jmp	.L10
.L2:
	cmp	DWORD PTR -340[rbp], 3
	jne	.L11
	mov	rax, QWORD PTR -352[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	atoi@PLT
	cmp	eax, 2
	jne	.L11
	mov	rax, QWORD PTR -352[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	atoi@PLT
	mov	DWORD PTR -292[rbp], eax
	lea	rsi, .LC6[rip]
	lea	rdi, .LC7[rip]
	call	fopen@PLT
	mov	QWORD PTR -24[rbp], rax
	mov	DWORD PTR -4[rbp], 0
	jmp	.L12
.L13:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	lea	rax, -160[rbp]
	add	rdx, rax
	mov	rax, QWORD PTR -24[rbp]
	lea	rsi, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	add	DWORD PTR -4[rbp], 1
.L12:
	mov	eax, DWORD PTR -292[rbp]
	cmp	DWORD PTR -4[rbp], eax
	jl	.L13
	mov	ecx, DWORD PTR -292[rbp]
	lea	rdx, -288[rbp]
	lea	rax, -160[rbp]
	mov	esi, ecx
	mov	rdi, rax
	call	Task@PLT
	mov	DWORD PTR -16[rbp], eax
	lea	rsi, .LC8[rip]
	lea	rdi, .LC9[rip]
	call	fopen@PLT
	mov	QWORD PTR -32[rbp], rax
	mov	DWORD PTR -4[rbp], 0
	jmp	.L14
.L15:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	mov	edx, DWORD PTR -288[rbp+rax*4]
	mov	rax, QWORD PTR -32[rbp]
	lea	rsi, .LC5[rip]
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT
	add	DWORD PTR -4[rbp], 1
.L14:
	mov	eax, DWORD PTR -4[rbp]
	cmp	eax, DWORD PTR -16[rbp]
	jl	.L15
	jmp	.L10
.L11:
	cmp	DWORD PTR -340[rbp], 2
	jne	.L10
	mov	rax, QWORD PTR -352[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	atoi@PLT
	cmp	eax, 3
	jne	.L10
	mov	rax, QWORD PTR -352[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	atoi@PLT
	mov	DWORD PTR -292[rbp], eax
	lea	rax, -320[rbp]
	mov	rsi, rax
	mov	edi, 1
	call	clock_gettime@PLT
	lea	rax, -336[rbp]
	mov	rsi, rax
	mov	edi, 1
	call	clock_gettime@PLT
	mov	rax, QWORD PTR -328[rbp]
	mov	edx, eax
	mov	rax, QWORD PTR -312[rbp]
	sub	edx, eax
	mov	eax, edx
	mov	edi, eax
	call	srand@PLT
	mov	DWORD PTR -292[rbp], 0
	jmp	.L16
.L17:
	call	rand@PLT
	mov	DWORD PTR -292[rbp], eax
.L16:
	mov	eax, DWORD PTR -292[rbp]
	test	eax, eax
	jle	.L17
	mov	eax, DWORD PTR -292[rbp]
	cmp	eax, 30
	jg	.L17
	mov	DWORD PTR -4[rbp], 0
	jmp	.L18
.L20:
	call	rand@PLT
	mov	edx, DWORD PTR -4[rbp]
	movsx	rdx, edx
	mov	DWORD PTR -160[rbp+rdx*4], eax
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	mov	eax, DWORD PTR -160[rbp+rax*4]
	and	eax, 3
	test	eax, eax
	jne	.L19
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	mov	eax, DWORD PTR -160[rbp+rax*4]
	neg	eax
	mov	edx, eax
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	mov	DWORD PTR -160[rbp+rax*4], edx
.L19:
	add	DWORD PTR -4[rbp], 1
.L18:
	mov	eax, DWORD PTR -292[rbp]
	cmp	DWORD PTR -4[rbp], eax
	jl	.L20
	mov	eax, DWORD PTR -292[rbp]
	mov	esi, eax
	lea	rdi, .LC10[rip]
	mov	eax, 0
	call	printf@PLT
	lea	rdi, .LC11[rip]
	mov	eax, 0
	call	printf@PLT
	mov	DWORD PTR -4[rbp], 0
	jmp	.L21
.L22:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	mov	eax, DWORD PTR -160[rbp+rax*4]
	mov	esi, eax
	lea	rdi, .LC5[rip]
	mov	eax, 0
	call	printf@PLT
	add	DWORD PTR -4[rbp], 1
.L21:
	mov	eax, DWORD PTR -292[rbp]
	cmp	DWORD PTR -4[rbp], eax
	jl	.L22
	mov	edi, 10
	call	putchar@PLT
	mov	ecx, DWORD PTR -292[rbp]
	lea	rdx, -288[rbp]
	lea	rax, -160[rbp]
	mov	esi, ecx
	mov	rdi, rax
	call	Task@PLT
	mov	DWORD PTR -16[rbp], eax
	lea	rdi, .LC4[rip]
	mov	eax, 0
	call	printf@PLT
	mov	DWORD PTR -12[rbp], 0
	jmp	.L23
.L24:
	mov	eax, DWORD PTR -12[rbp]
	cdqe
	mov	eax, DWORD PTR -288[rbp+rax*4]
	mov	esi, eax
	lea	rdi, .LC5[rip]
	mov	eax, 0
	call	printf@PLT
	add	DWORD PTR -12[rbp], 1
.L23:
	mov	eax, DWORD PTR -12[rbp]
	cmp	eax, DWORD PTR -16[rbp]
	jl	.L24
	mov	edi, 10
	call	putchar@PLT
.L10:
	mov	eax, 0
.L25:
	leave
	ret
	.size	main, .-main
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
