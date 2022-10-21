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

Убраны следующие строчки кода:<br>
```s
	endbr64                                                       #50-я строка

	.size	main, .-main
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0"          #346-я строка
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

### - Модифицированная ассемблерная программа отдельно откомпилирована и скомпонована без использования опций отладки.
Скомпоновала программу, с помощью команд:
```s
gcc -masm=intel -fno-asynchronous-unwind-tables -fno-jump-tables -fno-stack-protector -fno-exceptions ./main.c -S -o ./main.s
gcc -masm=intel -fno-asynchronous-unwind-tables -fno-jump-tables -fno-stack-protector -fno-exceptions ./task.c -S -o ./task.s
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

Для реализации данного пункта использовалась отдельная функция, которая принимает параметры array[], size и *B:
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

### - В функциях для формальных параметров добавить комментарии, описывающие связь между параметрами языка Си и регистрами (стеком).
> главный файл с функцией main - [main.s](https://github.com/Raaazzy/Home_work_1/blob/main/%D0%BF%D0%BE%D1%81%D0%BB%D0%B5%20%D0%BC%D0%BE%D0%B4%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D0%B8%20%D0%BD%D0%B0%204/main.s)<br>
побочный файл с функцией task для создания массива B - [task.s](https://github.com/Raaazzy/Home_work_1/tree/main/%D0%BF%D0%BE%D1%81%D0%BB%D0%B5%20%D0%BC%D0%BE%D0%B4%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D0%B8%20%D0%BD%D0%B0%204)<br>

# На 6 баллов:

# На 7 баллов:
### - Реализация программы на ассемблере, полученной после рефакторинга, в виде двух или более единиц компиляции.
Было получено 2 единицы компиляции: 
главный файл с функцией main - [main.c](https://github.com/Raaazzy/Home_work_1/blob/main/%D0%B4%D0%BE%20%D0%BC%D0%BE%D0%B4%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D0%B8/main.c)<br>
побочный файл с функцией task для создания массива B - [task.c](https://github.com/Raaazzy/Home_work_1/blob/main/%D0%B4%D0%BE%20%D0%BC%D0%BE%D0%B4%D0%B8%D1%84%D0%B8%D0%BA%D0%B0%D1%86%D0%B8%D0%B8/task.c)<br>
Скомпоновала программу, с помощью команд:
```s
gcc -masm=intel -fno-asynchronous-unwind-tables -fno-jump-tables -fno-stack-protector -fno-exceptions ./main.c -S -o ./main.s
gcc -masm=intel -fno-asynchronous-unwind-tables -fno-jump-tables -fno-stack-protector -fno-exceptions ./task.c -S -o ./task.s
gcc ./main.s -c -o main.o
gcc ./task.s -c -o task.o
gcc ./task.o main.o -o program.exe
```

# На 8 баллов:
### - Добавлен генератор случайных наборов данных, расширяющих возможности тестирования:
```c
a_size = atoi(argv[1]);
input = fopen("input.txt", "r");
// Ввод длины массива
printf("Input length (0 < length <= %d): ", max_size);
a_size = atoi(argv[argc - 1]);
// Проверка длины массива на коррекность
if(a_size < 1 || a_size > max_size) {
      printf("Incorrect length = %d\n", a_size);
      return 1;
}
// Чтение с файла значение элементов массива А
for(i = 0; i < a_size; ++i) {
      fscanf(input,"%d", A + i);
}
printf("Length of array A: %d \n", a_size);
printf("Array A: ");
for(i = 0; i < a_size; ++i) {
      printf("%d ", A[i]);
}
printf("\n");
// Вызов метода для извлечения из А положительных элементов в B
b_size = Task(A, a_size, B);
// Запись в файл массива B
output = fopen("output.txt", "w");
for(i = 0; i < b_size; ++i) {
      fprintf(output, "%d", B[i]);
}
```
### - Генератор подключен к программе с выбором в командной строке варианта ввода данных:<br>
Проверяю, что в консоль введен 1 аргумент, а далее значение этого аргумента.<br>
Если равен 1, то значит, что пользователь выбрал ввод с консоли.<br>
Если равен 2, то значит, что пользователь выбрал ввод с файла.<br>
Если равен 3, то значит, что пользователь выбрал ввод с помощью рандома.<br>

```c
        if (argc == 2 && atoi(argv[1]) == 1) {}
        else if (argc == 2 && atoi(argv[1]) == 2) {}
        else if (argc == 2 && atoi(argv[1]) == 3) {}
```
