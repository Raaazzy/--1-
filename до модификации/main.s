# -4[rbp] - i
# -8[rbp] - локальная i
# -12[rbp] - очень локальная i
# -16[rbp] - b_size
# -24[rbp] - input
# -32[rbp] - output
# -160[rbp] - A 
# -288[rbp] - B
# -292[rbp] - a_size
# -312[rbp] - start.tv_nsec
# -320[rbp] - start
# -328[rbp] - end.tv_nsec
# -336[rbp] - end
# -340[rbp] - args
# -352[rbp] - argv
	
	.file	"main.c"
	.intel_syntax noprefix
	.text											# начинаем новую секцию
	.section	.rodata								#.rodata, в которую мы положили:
	.align 8
.LC0:
	.string	"Input length (0 < length <= %d): "		#.LC0: "Input length (0 < length <= %d): "
.LC1:
	.string	"%d"									#.LC1: "%d"
.LC2:
	.string	"Incorrect length = %d\n"				#.LC2: "Incorrect length = %d\n"
.LC3:
	.string	"Input A[%d]: "							#.LC3: "Input A[%d]: "
.LC4:
	.string	"Result: "								#.LC4: "Result: "
.LC5:
	.string	"%d "									#.LC5: "%d "
.LC6:
	.string	"r"										#.LC6: "r"
.LC7:
	.string	"input.txt"								#.LC7: "input.txt"
.LC8:	
	.string	"w"										#.LC8: "w"
.LC9:
	.string	"output.txt"							#.LC9: "output.txt"
.LC10:
	.string	"Length of array A: %d \n"				#.LC10: "Length of array A: %d \n"
.LC11:
	.string	"Array A: "								#.LC11: "Array A: "
	.text											# начинаем новую секцию
	.globl	main
	.type	main, @function
main:
	endbr64											
	push	rbp
	mov	rbp, rsp									
	sub	rsp, 352									
	mov	DWORD PTR -340[rbp], edi					# edi - первый аргумент - argc, который лежит на -340 ячейке в стеке
	mov	QWORD PTR -352[rbp], rsi					# rsi - второй аргумент - argv, который лежит на -352 ячейке в стеке
	
	cmp	DWORD PTR -340[rbp], 2						# сравниваем args с 2
	jne	.L2											
	mov	rax, QWORD PTR -352[rbp]					# запись argv[1] в eax на позиции -352
	add	rax, 8										# argv[1] лежит на позиции -344
	mov	rax, QWORD PTR [rax]						# кладем значение командной строки в rax
	mov	rdi, rax									
	call	atoi@PLT
	cmp	eax, 1										# сравниваем argv[1] с 1
	jne	.L2

	mov	rax, QWORD PTR -352[rbp]					# запись argv[1] в eax на позиции -352
	add	rax, 8										# argv[1] лежит на позиции -344
	mov	rax, QWORD PTR [rax]						# кладем значение командной строки в rax
	mov	rdi, rax
	call	atoi@PLT
	mov	DWORD PTR -292[rbp], eax					# запись eax в a_size на позиции -292

	mov	esi, 30
	lea	rdi, .LC0[rip]
	mov	eax, 0
	call	printf@PLT

	lea	rax, -292[rbp]								# запись &a_size в rax
	mov	rsi, rax
	lea	rdi, .LC1[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT						# пользователь вводит это что-то тут

	mov	eax, DWORD PTR -292[rbp]					# запись a_size в eax на позиции -292
	test	eax, eax
	jle	.L3
	mov	eax, DWORD PTR -292[rbp]					# запись a_size в eax на позиции -292
	cmp	eax, 30										# сравниваем a_size с 30
	jle	.L4
.L3:
	mov	eax, DWORD PTR -292[rbp]					# запись a_size в eax на позиции -292
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
	mov	eax, DWORD PTR -4[rbp]						# запись i в eax на позиции -4
	mov	esi, eax
	lea	rdi, .LC3[rip]
	mov	eax, 0
	call	printf@PLT

	mov	eax, DWORD PTR -4[rbp]						# запись i в eax на позиции -4
	cdqe
	lea	rdx, 0[0+rax*4] 							# запись смещения в байтах на i в rdx
	lea	rax, -160[rbp]								# запись &A[0] в rax
	add	rax, rdx
	mov	rsi, rax
	lea	rdi, .LC1[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT
	add	DWORD PTR -4[rbp], 1						# смещение i на 1 позицию
.L6:
	mov	eax, DWORD PTR -292[rbp]					# запись a_size в eax на позиции -292
	cmp	DWORD PTR -4[rbp], eax						# сравниваем a_size с i
	jl	.L7
	mov	ecx, DWORD PTR -292[rbp]					# передача a_size task на позиции -292
	lea	rdx, -288[rbp]								# передача &B task на позиции -288
	lea	rax, -160[rbp]								# передача &A task на позиции -160
	mov	esi, ecx
	mov	rdi, rax
	call	Task@PLT
	mov	DWORD PTR -16[rbp], eax						# запись eax в b_size на позиции -16
	lea	rdi, .LC4[rip]
	mov	eax, 0
	call	printf@PLT
	mov	DWORD PTR -8[rbp], 0						# присваивание локальной i на позиции -8 нуля
	jmp	.L8
.L9:
	mov	eax, DWORD PTR -8[rbp]						# запись локальной i в eax на позиции -8
	cdqe
	mov	eax, DWORD PTR -288[rbp+rax*4]				# запись в B на позиции -288 смещения в байтах на локальную i в eax
	mov	esi, eax
	lea	rdi, .LC5[rip]
	mov	eax, 0
	call	printf@PLT
	add	DWORD PTR -8[rbp], 1						# присваивание локальной i на позиции -8 единицы
.L8:
	mov	eax, DWORD PTR -8[rbp]						# запись локальной i в eax на позиции -8
	cmp	eax, DWORD PTR -16[rbp]						# сравниваем b_size с локальной i
	jl	.L9
	mov	edi, 10
	call	putchar@PLT
	jmp	.L10
.L2:
	cmp	DWORD PTR -340[rbp], 3						# сравниваем args с 3
	jne	.L11
	mov	rax, QWORD PTR -352[rbp]					# запись argv[1] в eax на позиции -352
	add	rax, 8										# argv[1] лежит на позиции -344
	mov	rax, QWORD PTR [rax]						# кладем значение командной строки в rax
	mov	rdi, rax
	call	atoi@PLT
	cmp	eax, 2										# сравниваем argv[1] с 2
	jne	.L11

	mov	rax, QWORD PTR -352[rbp]					# запись argv[1] в eax на позиции -352
	add	rax, 16										# argv[2] лежит на позиции -336
	mov	rax, QWORD PTR [rax]						# кладем значение командной строки в rax
	mov	rdi, rax
	call	atoi@PLT
	mov	DWORD PTR -292[rbp], eax					# запись eax в a_size на позиции -292

	lea	rsi, .LC6[rip]
	lea	rdi, .LC7[rip]
	call	fopen@PLT
	mov	QWORD PTR -24[rbp], rax						# запись rax в input на позиции -24
	mov	DWORD PTR -4[rbp], 0						# запись 0 в i на позиции -4
	jmp	.L12
.L13:
	mov	eax, DWORD PTR -4[rbp]						# запись локальной i в eax на позиции -4
	cdqe
	lea	rdx, 0[0+rax*4]								# запись смещения в байтах на i в rdx
	lea	rax, -160[rbp]								# запись &A[0] в rax
	add	rdx, rax
	mov	rax, QWORD PTR -24[rbp]						# запись input в rax на позиции -24
	lea	rsi, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	add	DWORD PTR -4[rbp], 1						# запись 1 в i на позиции -4
.L12:
	mov	eax, DWORD PTR -292[rbp]					# запись a_size в eax на позиции -292
	cmp	DWORD PTR -4[rbp], eax						# запись eax в i на позиции -4
	jl	.L13
	mov	ecx, DWORD PTR -292[rbp]					# передача a_size task на позиции -292
	lea	rdx, -288[rbp]								# передача &B task на позиции -288
	lea	rax, -160[rbp]								# передача &A task на позиции -160
	mov	esi, ecx
	mov	rdi, rax
	call	Task@PLT
	mov	DWORD PTR -16[rbp], eax						# запись eax в b_size на позиции -16
	lea	rsi, .LC8[rip]
	lea	rdi, .LC9[rip]
	call	fopen@PLT
	mov	QWORD PTR -32[rbp], rax						# запись rax в output на позиции -32
	mov	DWORD PTR -4[rbp], 0						# запись 0 в i на позиции -4
	jmp	.L14
.L15:
	mov	eax, DWORD PTR -4[rbp]						# запись локальной i в eax на позиции -4
	cdqe
	mov	edx, DWORD PTR -288[rbp+rax*4]				# запись в B на позиции -288 смещения в байтах на локальную i в eax
	mov	rax, QWORD PTR -32[rbp]						# запись output в rax на позиции -32
	lea	rsi, .LC5[rip]
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT
	add	DWORD PTR -4[rbp], 1						# запись 1 в i на позиции -4
.L14:
	mov	eax, DWORD PTR -4[rbp]						# запись локальной i в eax на позиции -4
	cmp	eax, DWORD PTR -16[rbp]						# сравнение b_size в eax на позиции -16 с i
	jl	.L15
	jmp	.L10
.L11:
	cmp	DWORD PTR -340[rbp], 2						# сравниваем args с 2
	jne	.L10
	mov	rax, QWORD PTR -352[rbp]					# запись argv[1] в eax на позиции -352
	add	rax, 8
	mov	rax, QWORD PTR [rax]						# кладем значение командной строки в rax
	mov	rdi, rax
	call	atoi@PLT
	cmp	eax, 3
	jne	.L10
	mov	rax, QWORD PTR -352[rbp]					# запись argv[1] в eax на позиции -352
	add	rax, 8
	mov	rax, QWORD PTR [rax]						# кладем значение командной строки в rax
	mov	rdi, rax
	call	atoi@PLT
	mov	DWORD PTR -292[rbp], eax					# запись eax в a_size на позиции -292
	lea	rax, -320[rbp]								# передача &start в clock_gettime на позиции -320
	mov	rsi, rax
	mov	edi, 1
	call	clock_gettime@PLT
	lea	rax, -336[rbp]								# передача &end в clock_gettime на позиции -336
	mov	rsi, rax
	mov	edi, 1
	call	clock_gettime@PLT
	mov	rax, QWORD PTR -328[rbp]					# запись end.tv_nsec в rax на позиции -328
	mov	edx, eax
	mov	rax, QWORD PTR -312[rbp]					# запись begin.tv_nsec в rax на позиции -312
	sub	edx, eax
	mov	eax, edx
	mov	edi, eax
	call	srand@PLT
	mov	DWORD PTR -292[rbp], 0						# присваивание a_size на позиции -292 единицы
	jmp	.L16
.L17:
	call	rand@PLT
	mov	DWORD PTR -292[rbp], eax					# запись eax в a_size на позиции -292
.L16:
	mov	eax, DWORD PTR -292[rbp]					# запись a_size в eax на позиции -292
	test	eax, eax
	jle	.L17
	mov	eax, DWORD PTR -292[rbp]					# запись a_size в eax на позиции -292
	cmp	eax, 30
	jg	.L17	
	mov	DWORD PTR -4[rbp], 0						# присваивание i на позиции -4 нуля
	jmp	.L18
.L20:
	call	rand@PLT
	mov	edx, DWORD PTR -4[rbp]						# запись локальной i в edx на позиции -4
	movsx	rdx, edx
	mov	DWORD PTR -160[rbp+rdx*4], eax				# запись в A на позиции -160 смещения в байтах на локальную i в eax
	mov	eax, DWORD PTR -4[rbp]						# запись i в eax на позиции -4
	cdqe
	mov	eax, DWORD PTR -160[rbp+rax*4]				# запись eax в A на позиции -160 смещения в байтах на локальную i
	and	eax, 3
	test	eax, eax
	jne	.L19
	mov	eax, DWORD PTR -4[rbp]						# запись локальной i в eax на позиции -4
	cdqe
	mov	eax, DWORD PTR -160[rbp+rax*4]				# запись eax в A на позиции -160 смещения в байтах на локальную i
	neg	eax
	mov	edx, eax
	mov	eax, DWORD PTR -4[rbp]						# запись локальной i в eax на позиции -4
	cdqe
	mov	DWORD PTR -160[rbp+rax*4], edx				# запись в A на позиции -160 смещения в байтах на локальную i в edx
.L19:
	add	DWORD PTR -4[rbp], 1						# запись 1 в i на позиции -4
.L18:
	mov	eax, DWORD PTR -292[rbp]					# запись a_size в eax на позиции -292
	cmp	DWORD PTR -4[rbp], eax						# сравниваем i с a_size
	jl	.L20
	mov	eax, DWORD PTR -292[rbp]					# запись a_size в eax на позиции -292
	mov	esi, eax
	lea	rdi, .LC10[rip]
	mov	eax, 0
	call	printf@PLT
	lea	rdi, .LC11[rip]
	mov	eax, 0
	call	printf@PLT
	mov	DWORD PTR -4[rbp], 0						# присваивание i на позиции -4 нуля
	jmp	.L21
.L22:
	mov	eax, DWORD PTR -4[rbp]						# запись i в eax на позиции -4
	cdqe
	mov	eax, DWORD PTR -160[rbp+rax*4]				# запись eax в A на позиции -160 смещения в байтах на локальную i
	mov	esi, eax
	lea	rdi, .LC5[rip]
	mov	eax, 0
	call	printf@PLT
	add	DWORD PTR -4[rbp], 1						# присваивание i на позиции -4 единицы 
.L21:
	mov	eax, DWORD PTR -292[rbp]					# запись a_size в eax на позиции -292
	cmp	DWORD PTR -4[rbp], eax						# сравниваем i с a_size
	jl	.L22
	mov	edi, 10
	call	putchar@PLT
	mov	ecx, DWORD PTR -292[rbp]					# запись a_size в ecx на позиции -292
	lea	rdx, -288[rbp]								# передача &B task на позиции -288
	lea	rax, -160[rbp]								# передача &A task на позиции -160
	mov	esi, ecx
	mov	rdi, rax
	call	Task@PLT
	mov	DWORD PTR -16[rbp], eax						# запись eax в b_size на позиции -16
	lea	rdi, .LC4[rip]
	mov	eax, 0
	call	printf@PLT
	mov	DWORD PTR -12[rbp], 0						# запись 0 в очень локальную i на позиции -12
	jmp	.L23
.L24:
	mov	eax, DWORD PTR -12[rbp]						# запись очень локальной i на позиции -12
	cdqe
	mov	eax, DWORD PTR -288[rbp+rax*4]				# запись eax в B на позиции -288 смещения в байтах на локальную i
	mov	esi, eax
	lea	rdi, .LC5[rip]
	mov	eax, 0
	call	printf@PLT
	add	DWORD PTR -12[rbp], 1						# запись 1 в очень локальную i на позиции -12
.L23:
	mov	eax, DWORD PTR -12[rbp]						# запись очень локальной i на позиции -12
	cmp	eax, DWORD PTR -16[rbp]						# сравнение b_size в eax на позиции -16 с i
	jl	.L24
	mov	edi, 10
	call	putchar@PLT
.L10:
	mov	eax, 0										# return 0
.L25:
	leave											# выйти
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
