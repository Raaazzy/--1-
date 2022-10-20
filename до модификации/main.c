#include <stdio.h>
#include <time.h>
#include <stdlib.h>

#define max_size 30

extern int Task(int array[], int size,int *B);

int main(int argc, char** argv) {
    int A[max_size];
    int B[max_size];
    int a_size;
    int b_size;
    int i;
    struct timespec start;
    struct timespec end;
    FILE *input, *output;

    // Ввод с помощью консоли
    if (argc == 2 && atoi(argv[1]) == 1) {
        a_size = atoi(argv[1]);
        // Ввод длины массива
        printf("Input length (0 < length <= %d): ", max_size);
        scanf("%d", &a_size);
        // Проверка длины массива на коррекность
        if(a_size < 1 || a_size > max_size) {
            printf("Incorrect length = %d\n", a_size);
            return 1;
        }
        // Заполнение массива
        for(i = 0; i < a_size; ++i) {
            printf("Input A[%d]: ", i);
            scanf("%d", A + i);
        }
        // Вызов метода для извлечения из А положительных элементов в B
        b_size = Task(A, a_size, B);
        // Вывод массива B в консоль
        printf("Result: ");
        for(int i = 0; i < b_size; ++i) {
            printf("%d ", B[i]);
        }
        printf("\n");
    }
        // Ввод с помощью файла
    else if (argc == 3 && atoi(argv[1]) == 2) {
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
    }
        // Ввод с помощью рандома
    else if (argc == 2 && atoi(argv[1]) == 3) {
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
        printf("Length of array A: %d \n", a_size);
        printf("Array A: ");
        for(i = 0; i < a_size; ++i) {
            printf("%d ", A[i]);
        }
        printf("\n");
        // Вызов метода для извлечения из А положительных элементов в B
        b_size = Task(A, a_size, B);
        // Вывод массива B в консоль
        printf("Result: ");
        for(int i = 0; i < b_size; ++i) {
            printf("%d ", B[i]);
        }
        printf("\n");
    }
    return 0;
}
