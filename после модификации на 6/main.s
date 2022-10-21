# r11d - b_size
# r12d - i
# r13d - локальная i
# r14d - очень локальная i
# r15d - a_size
# -24[rbp] - input
# -32[rbp] - output
# -160[rbp] - A 
# -288[rbp] - B
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
	mov r15d, eax 									#запись eax в a_size в регистр r15d
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
	mov eax, r15d 									#запись a_size регистр r15d в eax
	mov	eax, DWORD PTR -292[rbp]					# запись a_size в eax на позиции -292
	test	eax, eax
	jle	.L3
	mov eax, r15d 									#запись a_size регистр r15d в eax
	mov	eax, DWORD PTR -292[rbp]					# запись a_size в eax на позиции -292
	cmp	eax, 30										# сравниваем a_size с 30
	jle	.L4
.L3:
	mov eax, r15d 									#запись a_size регистр r15d в eax
	mov	eax, DWORD PTR -292[rbp]					# запись a_size в eax на позиции -292
	mov	esi, eax
	lea	rdi, .LC2[rip]
	mov	eax, 0
	call	printf@PLT
	mov	eax, 1
	jmp	.L25
.L4:
	mov	r12d, 0
	jmp	.L6
.L7:
	mov	eax, r12d						# запись i в eax в регистр r12d
	mov	esi, eax
	lea	rdi, .LC3[rip]
	mov	eax, 0
	call	printf@PLT

	mov	eax, r12d						# запись i в eax в регистр r12d
	cdqe
	lea	rdx, 0[0+rax*4] 							# запись смещения в байтах на i в rdx
	lea	rax, -160[rbp]								# запись &A[0] в rax
	add	rax, rdx
	mov	rsi, rax
	lea	rdi, .LC1[rip]
	mov	eax, 0
	call	__isoc99_scanf@PLT
	add	r12d, 1						# смещение i на 1 позицию
.L6:
	mov eax, r15d 									#запись a_size регистр r15d в eax
	mov	eax, DWORD PTR -292[rbp]					# запись a_size в eax на позиции -292
	cmp	r12d, eax						# сравниваем a_size с i
	jl	.L7
	mov ecx, r15d 									#запись a_size регистр r15d в eсx
	mov	ecx, DWORD PTR -292[rbp]					# передача a_size task на позиции -292
	lea	rdx, -288[rbp]								# передача &B task на позиции -288
	lea	rax, -160[rbp]								# передача &A task на позиции -160
	mov	esi, ecx
	mov	rdi, rax
	call	Task@PLT
	mov	r11d, eax						# запись eax в b_size на позиции r11d
	mov	DWORD PTR -16[rbp], eax						# запись eax в b_size на позиции -16
	lea	rdi, .LC4[rip]
	mov	eax, 0
	call	printf@PLT
	mov	r13d, 0						# присваивание локальной i в регистр r13d нуля
	jmp	.L8
.L9:
	mov	eax, r13d						# запись локальной i в eax в регистр r13d
	cdqe
	mov	eax, DWORD PTR -288[rbp+rax*4]				# запись в B на позиции -288 смещения в байтах на локальную i в eax
	mov	esi, eax
	lea	rdi, .LC5[rip]
	mov	eax, 0
	call	printf@PLT
	add	r13d, 1						# присваивание локальной i в регистр r13d единицы
.L8:
	mov	eax, r13d						# запись локальной i в eax в регистр r13d
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
	mov r15d, eax 									#запись eax в a_size регистр r15d 
	mov	DWORD PTR -292[rbp], eax					# запись eax в a_size на позиции -292

	lea	rsi, .LC6[rip]
	lea	rdi, .LC7[rip]
	call	fopen@PLT
	mov	QWORD PTR -24[rbp], rax						# запись rax в input на позиции -24
	mov	r12d, 0						# запись 0 в i в регистр r12d
	jmp	.L12
.L13:
	mov	eax, r12d						# запись локальной i в eax в регистр r12d
	cdqe
	lea	rdx, 0[0+rax*4]								# запись смещения в байтах на i в rdx
	lea	rax, -160[rbp]								# запись &A[0] в rax
	add	rdx, rax
	mov	rax, QWORD PTR -24[rbp]						# запись input в rax на позиции -24
	lea	rsi, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	add	r12d, 1						# запись 1 в i в регистр r12d
.L12:
	mov eax, r15d 									#запись a_size регистр r15d в eax
	mov	eax, DWORD PTR -292[rbp]					# запись a_size в eax на позиции -292
	cmp	r12d, eax						# запись eax в i в регистр r12d
	jl	.L13
	mov ecx, r15d 									#запись a_size регистр r15d в ecx
	mov	ecx, DWORD PTR -292[rbp]					# передача a_size task на позиции -292
	lea	rdx, -288[rbp]								# передача &B task на позиции -288
	lea	rax, -160[rbp]								# передача &A task на позиции -160
	mov	esi, ecx
	mov	rdi, rax
	call	Task@PLT
	mov	r11d, eax						# запись eax в b_size на позиции r11d
	mov	DWORD PTR -16[rbp], eax						# запись eax в b_size на позиции -16
	lea	rsi, .LC8[rip]
	lea	rdi, .LC9[rip]
	call	fopen@PLT
	mov	QWORD PTR -32[rbp], rax						# запись rax в output на позиции -32
	mov	r12d, 0						# запись 0 в i в регистр r12d
	jmp	.L14
.L15:
	mov	eax, r12d						# запись локальной i в eax в регистр r12d
	cdqe
	mov	edx, DWORD PTR -288[rbp+rax*4]				# запись в B на позиции -288 смещения в байтах на локальную i в eax
	mov	rax, QWORD PTR -32[rbp]						# запись output в rax на позиции -32
	lea	rsi, .LC5[rip]
	mov	rdi, rax
	mov	eax, 0
	call	fprintf@PLT
	add	r12d, 1						# запись 1 в i в регистр r12d
.L14:
	mov	eax, r12d						# запись локальной i в eax в регистр r12d
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
	mov r15d, eax 									#запись eax в a_size регистр r15d 
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
	mov r15d, eax 									#запись eax в a_size регистр r15d 
	mov	DWORD PTR -292[rbp], eax					# запись eax в a_size на позиции -292
.L16:
	mov eax, r15d 									#запись a_size регистр r15d в eax
	mov	eax, DWORD PTR -292[rbp]					# запись a_size в eax на позиции -292
	test	eax, eax
	jle	.L17
	mov eax, r15d 									#запись a_size регистр r15d в eax
	mov	eax, DWORD PTR -292[rbp]					# запись a_size в eax на позиции -292
	cmp	eax, 30
	jg	.L17	
	mov	r12d, 0						# присваивание i в регистр r12d нуля
	jmp	.L18
.L20:
	call	rand@PLT
	mov	edx, r12d						# запись локальной i в edx в регистр r12d
	movsx	rdx, edx
	mov	DWORD PTR -160[rbp+rdx*4], eax				# запись в A на позиции -160 смещения в байтах на локальную i в eax
	mov	eax, r12d						# запись i в eax в регистр r12d
	cdqe
	mov	eax, DWORD PTR -160[rbp+rax*4]				# запись eax в A на позиции -160 смещения в байтах на локальную i
	and	eax, 3
	test	eax, eax
	jne	.L19
	mov	eax, r12d						# запись локальной i в eax в регистр r12d
	cdqe
	mov	eax, DWORD PTR -160[rbp+rax*4]				# запись eax в A на позиции -160 смещения в байтах на локальную i
	neg	eax
	mov	edx, eax
	mov	eax, r12d						# запись локальной i в eax в регистр r12d
	cdqe
	mov	DWORD PTR -160[rbp+rax*4], edx				# запись в A на позиции -160 смещения в байтах на локальную i в edx
.L19:
	add	r12d, 1						# запись 1 в i в регистр r12d
.L18:
	mov eax, r15d 									#запись a_size регистр r15d в eax
	mov	eax, DWORD PTR -292[rbp]					# запись a_size в eax на позиции -292
	cmp	r12d, eax						# сравниваем i с a_size
	jl	.L20
	mov eax, r15d 									#запись a_size регистр r15d в eax
	mov	eax, DWORD PTR -292[rbp]					# запись a_size в eax на позиции -292
	mov	esi, eax
	lea	rdi, .LC10[rip]
	mov	eax, 0
	call	printf@PLT
	lea	rdi, .LC11[rip]
	mov	eax, 0
	call	printf@PLT
	mov	r12d, 0						# присваивание i в регистр r12d нуля
	jmp	.L21
.L22:
	mov	eax, r12d						# запись i в eax в регистр r12d
	cdqe
	mov	eax, DWORD PTR -160[rbp+rax*4]				# запись eax в A на позиции -160 смещения в байтах на локальную i
	mov	esi, eax
	lea	rdi, .LC5[rip]
	mov	eax, 0
	call	printf@PLT
	add	r12d, 1						# присваивание i в регистр r12d единицы 
.L21:
	mov eax, r15d 									#запись a_size регистр r15d в eax
	mov	eax, DWORD PTR -292[rbp]					# запись a_size в eax на позиции -292
	cmp	r12d, eax						# сравниваем i с a_size
	jl	.L22
	mov	edi, 10
	call	putchar@PLT
	mov ecx, r15d 									#запись a_size регистр r15d в eax
	mov	ecx, DWORD PTR -292[rbp]					# запись a_size в ecx на позиции -292
	lea	rdx, -288[rbp]								# передача &B task на позиции -288
	lea	rax, -160[rbp]								# передача &A task на позиции -160
	mov	esi, ecx
	mov	rdi, rax
	call	Task@PLT
	mov	r11d, eax						# запись eax в b_size на позиции r11d
	mov	DWORD PTR -16[rbp], eax						# запись eax в b_size на позиции -16
	lea	rdi, .LC4[rip]
	mov	eax, 0
	call	printf@PLT
	mov	r14d, 0						# запись 0 в очень локальную i в регистр r14d
	jmp	.L23
.L24:
	mov	eax, r14d						# запись очень локальной i в регистр r14d
	cdqe
	mov	eax, DWORD PTR -288[rbp+rax*4]				# запись eax в B на позиции -288 смещения в байтах на локальную i
	mov	esi, eax
	lea	rdi, .LC5[rip]
	mov	eax, 0
	call	printf@PLT
	add	r14d, 1						# запись 1 в очень локальную i в регистр r14d
.L23:
	mov	eax, r14d						# запись очень локальной i на позиции -12
	cmp	eax, DWORD PTR -16[rbp]						# сравнение b_size в eax на позиции -16 с i
	jl	.L24
	mov	edi, 10
	call	putchar@PLT
.L10:
	mov	eax, 0										# return 0
.L25:
	leave											# выйти
	ret
	