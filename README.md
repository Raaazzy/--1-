# Arrays and integer calculations
Омирбекова Дария БПИ-217

# На 4 балла:
### - Приведено решение задачи на C.
> главный файл с функцией main (до модификации) - [main.c](https://github.com/Raaazzy/Home_work_1/blob/main/%D0%B4%D0%BE%20%D0%BC%D0%BE%D0%B4%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D0%B8/main.c)<br>
побочный файл с функцией task для создания массива B (до модификации) - [task.c](https://github.com/Raaazzy/Home_work_1/blob/main/%D0%B4%D0%BE%20%D0%BC%D0%BE%D0%B4%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D0%B8/task.c)<br>

### - В полученную ассемблерную программу, откомпилированную без оптимизирующих и отладочных опций, добавлены комментарии, поясняющие эквивалентное представление переменных в программе на C.
> главный файл с функцией main (до модификации) - [main.s](https://github.com/Raaazzy/Home_work_1/blob/main/%D0%B4%D0%BE%20%D0%BC%D0%BE%D0%B4%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D0%B8/main.s)<br>
побочный файл с функцией task для создания массива B (до модификации) - [task.s](https://github.com/Raaazzy/Home_work_1/blob/main/%D0%B4%D0%BE%20%D0%BC%D0%BE%D0%B4%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D0%B8/task.s)<br>

### - Из ассемблерной программы убраны лишние макросы за счет использования соответствующих аргументов командной строки:
> главный файл с функцией main (после модификации) - [main.s](https://github.com/Raaazzy/Home_work_1/blob/main/%D0%BF%D0%BE%D1%81%D0%BB%D0%B5%20%D0%BC%D0%BE%D0%B4%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D0%B8%20%D0%BD%D0%B0%204/main.s)<br>
побочный файл с функцией task для создания массива B (после модификации) - [task.s](https://github.com/Raaazzy/Home_work_1/tree/main/%D0%BF%D0%BE%D1%81%D0%BB%D0%B5%20%D0%BC%D0%BE%D0%B4%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D0%B8%20%D0%BD%D0%B0%204)<br>

Убраны следующие строчки кода в файле main.s:<br>
```s
	endbr64                                                       #50-я строка
	
	cdqe							      #109-я строка, 175-я строка и много где еще

	.size	main, .-main					      #346-я строка
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
4:                                                                     #364-я строка
```
Убраны следующие строчки кода в файле task.s:<br>
```s
	endbr64                                                       #13-я строка
	
	cdqe							      #23-я строка, 31-я строка
	
	.size	Task, .-Task					      #53-я строка
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
4:							     	       #70-я строка
```

### - Модифицированная ассемблерная программа отдельно откомпилирована и скомпонована без использования опций отладки.
Скомпоновала программу, с помощью команд:
```s
gcc -masm=intel -fno-asynchronous-unwind-tables -fno-jump-tables -fno-stack-protector -fno-exceptions ./main.c -S -o ./main.s
gcc -masm=intel -fno-asynchronous-unwind-tables -fno-jump-tables -fno-stack-protector -fno-exceptions ./task.c -S -o ./task.s
gcc ./main.s -c -o main.o
gcc ./task.s -c -o task.o
gcc ./task.o main.o -o program.exe
```

### - Представлено полное тестовое покрытие, дающее одинаковый результат на обоих программах.
Программы были протестированы на следующих тестовых данных:
```
1 1 -1 1 1
1 2 3 4 5
-1 2 -3 4 -5
1
0
1 1 1 -8 1 1 1 1 1 1 0 1 1 1 -1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 -2
```
- Все тесты обе программы выполнили успешно, выдав одинаковый результат:
1. ![image](https://user-images.githubusercontent.com/111382627/197212536-fc3b1770-199c-4c59-ab20-5bb58dc49624.png)
2. ![image](https://user-images.githubusercontent.com/111382627/197213133-dcfe9a21-25b4-4591-8bee-8ae9e7984ed8.png)
3. ![image](https://user-images.githubusercontent.com/111382627/197213258-ec63bf05-0158-4ac6-99a0-77fb263eb722.png)
4. ![image](https://user-images.githubusercontent.com/111382627/197212745-a52ba679-308f-49a2-9af9-c8f1b93a4d9e.png)
5. ![image](https://user-images.githubusercontent.com/111382627/197213394-beb79933-9387-4893-a6a9-de258e3d7cec.png)
6. ![image](https://user-images.githubusercontent.com/111382627/197214039-5a71eaed-12f6-4571-9dc9-c0f0243a444d.png)

# На 5 баллов:
### - В реализованной программе использовать функции с передачей данных через параметры.
> файл с функцией task для создания массива B - [task.c](https://github.com/Raaazzy/Home_work_1/blob/main/%D0%BF%D0%BE%D1%81%D0%BB%D0%B5%20%D0%BC%D0%BE%D0%B4%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D0%B8%20%D0%BD%D0%B0%204/task.c)<br>

Для реализации данного пункта использовалась отдельная функция Task, которая принимает параметры array[], size и *B:
```c
int Task(int array[], int size,int *B)
```

### - Использовать локальные переменные.
> главный файл с функцией main - [main.c](https://github.com/Raaazzy/Home_work_1/blob/main/%D0%BF%D0%BE%D1%81%D0%BB%D0%B5%20%D0%BC%D0%BE%D0%B4%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D0%B8%20%D0%BD%D0%B0%204/main.c)<br>
побочный файл с функцией task для создания массива B - [task.c](https://github.com/Raaazzy/Home_work_1/blob/main/%D0%BF%D0%BE%D1%81%D0%BB%D0%B5%20%D0%BC%D0%BE%D0%B4%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D0%B8%20%D0%BD%D0%B0%204/task.c)<br>

Локальные переменные, которые были использованы в функции main:
```c
int A[max_size];
int B[max_size];
int a_size;
int b_size;
int i;
struct timespec start;
struct timespec end;
FILE *input, *output;
```
Локальные переменные, которые были использованы в функции task:
```c
int j;
int counter = 0;
```
### - В ассемблерную программу при вызове функции добавить комментарии, описывающие передачу фактических параметров и перенос возвращаемого результата.
> главный файл с функцией main - [main.s](https://github.com/Raaazzy/Home_work_1/blob/main/%D0%BF%D0%BE%D1%81%D0%BB%D0%B5%20%D0%BC%D0%BE%D0%B4%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D0%B8%20%D0%BD%D0%B0%204/main.s)<br>
побочный файл с функцией task для создания массива B - [task.s](https://github.com/Raaazzy/Home_work_1/tree/main/%D0%BF%D0%BE%D1%81%D0%BB%D0%B5%20%D0%BC%D0%BE%D0%B4%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D0%B8%20%D0%BD%D0%B0%204)<br>

### - В функциях для формальных параметров добавить комментарии, описывающие связь между параметрами языка Си и регистрами (стеком).
> главный файл с функцией main - [main.s](https://github.com/Raaazzy/Home_work_1/blob/main/%D0%BF%D0%BE%D1%81%D0%BB%D0%B5%20%D0%BC%D0%BE%D0%B4%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D0%B8%20%D0%BD%D0%B0%204/main.s)<br>
побочный файл с функцией task для создания массива B - [task.s](https://github.com/Raaazzy/Home_work_1/tree/main/%D0%BF%D0%BE%D1%81%D0%BB%D0%B5%20%D0%BC%D0%BE%D0%B4%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D0%B8%20%D0%BD%D0%B0%204)<br>

# На 6 баллов:
### - Рефакторинг программы на ассемблере за счет максимального использования регистров процессора.
Все локальные переменные заменены на регистры. Добавлены соответствующие комментарии в коде программ.<br>
> В файле с функцией main - [main.s](https://github.com/Raaazzy/Home_work_1/blob/main/%D0%BF%D0%BE%D1%81%D0%BB%D0%B5%20%D0%BC%D0%BE%D0%B4%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D0%B8%20%D0%BD%D0%B0%206/main.s):<br>
```
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
```
> В файле с функцией task - [task.s](https://github.com/Raaazzy/Home_work_1/blob/main/%D0%BF%D0%BE%D1%81%D0%BB%D0%B5%20%D0%BC%D0%BE%D0%B4%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D0%B8%20%D0%BD%D0%B0%206/task.s):<br>
```
# r11d - j
# r12d - counter
# -24[rbp] - array
# -28[rbp] - size
# -40[rbp] - B
```

### - Добавление комментариев в разработанную программу, поясняющих эквивалентное использование регистров вместо переменных исходной программы на C.
> главный файл с функцией main - [main.s](https://github.com/Raaazzy/Home_work_1/blob/main/%D0%BF%D0%BE%D1%81%D0%BB%D0%B5%20%D0%BC%D0%BE%D0%B4%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D0%B8%20%D0%BD%D0%B0%206/main.s)<br>
побочный файл с функцией task для создания массива B - [task.s](https://github.com/Raaazzy/Home_work_1/blob/main/%D0%BF%D0%BE%D1%81%D0%BB%D0%B5%20%D0%BC%D0%BE%D0%B4%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D0%B8%20%D0%BD%D0%B0%206/task.s)<br>

### - Представлены тестовые прогоны для разработанной программы.
Программа была протестирована на следующих тестовых данных:
```
1 1 -1 1 1
1 2 3 4 5
-1 2 -3 4 -5
1
0
1 1 1 -8 1 1 1 1 1 1 0 1 1 1 -1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 -2
```
- Все тесты программа выполнила успешно, выдав корректный результат:
> ![image](https://user-images.githubusercontent.com/111382627/197212536-fc3b1770-199c-4c59-ab20-5bb58dc49624.png)
![image](https://user-images.githubusercontent.com/111382627/197213133-dcfe9a21-25b4-4591-8bee-8ae9e7984ed8.png)
![image](https://user-images.githubusercontent.com/111382627/197213258-ec63bf05-0158-4ac6-99a0-77fb263eb722.png)
![image](https://user-images.githubusercontent.com/111382627/197212745-a52ba679-308f-49a2-9af9-c8f1b93a4d9e.png)
![image](https://user-images.githubusercontent.com/111382627/197213394-beb79933-9387-4893-a6a9-de258e3d7cec.png)
![image](https://user-images.githubusercontent.com/111382627/197214039-5a71eaed-12f6-4571-9dc9-c0f0243a444d.png)

# На 7 баллов:
### - Реализация программы на ассемблере, полученной после рефакторинга, в виде двух или более единиц компиляции.
Было получено 2 единицы компиляции: 
> главный файл с функцией main - [main.s](https://github.com/Raaazzy/Home_work_1/blob/main/%D0%BF%D0%BE%D1%81%D0%BB%D0%B5%20%D0%BC%D0%BE%D0%B4%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D0%B8%20%D0%BD%D0%B0%206/main.s)<br>
побочный файл с функцией task для создания массива B - [task.s](https://github.com/Raaazzy/Home_work_1/blob/main/%D0%BF%D0%BE%D1%81%D0%BB%D0%B5%20%D0%BC%D0%BE%D0%B4%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D0%B8%20%D0%BD%D0%B0%206/task.s)<br>

Программа скомпанована с помощью команд:
```s
gcc -masm=intel -fno-asynchronous-unwind-tables -fno-jump-tables -fno-stack-protector -fno-exceptions ./main.c -S -o ./main.s
gcc -masm=intel -fno-asynchronous-unwind-tables -fno-jump-tables -fno-stack-protector -fno-exceptions ./task.c -S -o ./task.s
gcc ./main.s -c -o main.o
gcc ./task.s -c -o task.o
gcc ./task.o main.o -o program.exe
```
### - Задание файлов с исходными данными и файла для вывода результатов с использованием аргументов командной строки.
> главный файл с функцией main - [main.c](https://github.com/Raaazzy/Home_work_1/blob/main/%D0%BF%D0%BE%D1%81%D0%BB%D0%B5%20%D0%BC%D0%BE%D0%B4%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D0%B8%20%D0%BD%D0%B0%206/main.c)<br>
побочный файл с функцией task для создания массива B - [task.c](https://github.com/Raaazzy/Home_work_1/blob/main/%D0%BF%D0%BE%D1%81%D0%BB%D0%B5%20%D0%BC%D0%BE%D0%B4%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D0%B8%20%D0%BD%D0%B0%206/task.c)<br>

Данный пункт реализован с помощью добавления фрагмента кода в функцию main:
```c
a_size = atoi(argv[2]);
input = fopen("input.txt", "r");
// Чтение с файла значение элементов массива А
for(i = 0; i < a_size; ++i) {
	fscanf(input,"%d", A + i);
}
// Вызов метода для извлечения из А положительных элементов в B
b_size = Task(A, a_size, B);
// Запись в файл массива B
output = fopen("output.txt", "w");
for(i = 0; i < b_size; ++i) {
	fprintf(output, "%d ", B[i]);
}
```

# На 8 баллов:
### - Добавлен генератор случайных наборов данных, расширяющих возможности тестирования:
> главный файл с функцией main - [main.c](https://github.com/Raaazzy/Home_work_1/blob/main/%D0%BF%D0%BE%D1%81%D0%BB%D0%B5%20%D0%BC%D0%BE%D0%B4%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D0%B8%20%D0%BD%D0%B0%208/main.c)<br>
побочный файл с функцией task для создания массива B - [task.c](https://github.com/Raaazzy/Home_work_1/blob/main/%D0%BF%D0%BE%D1%81%D0%BB%D0%B5%20%D0%BC%D0%BE%D0%B4%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D0%B8%20%D0%BD%D0%B0%208/task.c)<br>

Данный пункт реализован с помощью добавления фрагмента кода в функцию main:
```c
a_size = atoi(argv[1]);
clock_gettime(CLOCK_MONOTONIC, &start);
clock_gettime(CLOCK_MONOTONIC, &end);
srand(end.tv_nsec - start.tv_nsec);
a_size = 0;
// Генерация случайной длины
while(a_size < 1 || a_size > max_size){
	a_size = rand();
}
// Заполнение массива А случайными данными
for(i = 0; i < a_size; ++i) {
	A[i] = rand();
	if(A[i] % 4 == 0){
		A[i] *= -1;
	}
}
```
### - Генератор подключен к программе с выбором в командной строке варианта ввода данных:
> главный файл с функцией main - [main.c](https://github.com/Raaazzy/Home_work_1/blob/main/%D0%BF%D0%BE%D1%81%D0%BB%D0%B5%20%D0%BC%D0%BE%D0%B4%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D0%B8%20%D0%BD%D0%B0%208/main.c)<br>
побочный файл с функцией task для создания массива B - [task.c](https://github.com/Raaazzy/Home_work_1/blob/main/%D0%BF%D0%BE%D1%81%D0%BB%D0%B5%20%D0%BC%D0%BE%D0%B4%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D0%B8%20%D0%BD%D0%B0%208/task.c)<br>

Проверяю, что в консоль введен один аргумент, а далее значение этого аргумента:<br>
- если равен 1, то значит, что пользователь выбрал ввод с консоли.<br>
- если равен 2, то значит, что пользователь выбрал ввод с файла.<br>
- если равен 3, то значит, что пользователь выбрал ввод с помощью рандома.<br>
```c
        if (argc == 2 && atoi(argv[1]) == 1) {}
        else if (argc == 2 && atoi(argv[1]) == 2) {}
        else if (argc == 2 && atoi(argv[1]) == 3) {}
```
### - Добавены замеры во времени, которые не учитывают время ввода и вывода данных.
> главный файл с функцией main - [main.c](https://github.com/Raaazzy/Home_work_1/blob/main/%D0%BF%D0%BE%D1%81%D0%BB%D0%B5%20%D0%BC%D0%BE%D0%B4%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D0%B8%20%D0%BD%D0%B0%208/main.c)<br>
побочный файл с функцией task для создания массива B - [task.c](https://github.com/Raaazzy/Home_work_1/blob/main/%D0%BF%D0%BE%D1%81%D0%BB%D0%B5%20%D0%BC%D0%BE%D0%B4%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D0%B8%20%D0%BD%D0%B0%208/task.c)<br>

Данный пункт осуществлен с помощью добавления таймера в функцию main:
```c
// Таймер
time_t start_time =  clock();
for (i = 0; i < 2000000; ++i) {
	// Вызов метода для извлечения из А положительных элементов в B
	b_size = Task(A, a_size, B);
}
time_t end_time = clock();
printf("\nпрограмма работает %f миллисекунд\n", difftime(end_time, start_time));
```

- По результатом замеров, было выявлено, что модифицированная программа работает быстрее на 1-1.5 секунды:<br>
> Не модифицированная программа:<br>
![image](https://user-images.githubusercontent.com/111382627/197294709-0eabd659-cac1-4221-8b45-f6470758fb7d.png)
Модифицированная программа:<br>
![image](https://user-images.githubusercontent.com/111382627/197294759-be0d2fdb-8da2-4779-88db-409218ecd6ec.png)
