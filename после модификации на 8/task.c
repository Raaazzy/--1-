#include <stdio.h>
#include <time.h>
#include <stdlib.h>

extern int array[];

int Task(int array[], int size,int *B){
    int j;
    int counter = 0;
    // Пробегаемся по массиву A
    for(j = 0; j < size; ++j){
        // Записываем в B только положительные элементы
        if(array[j] > 0){
            B[counter] = array[j];
            ++counter;
        }
    }
    return counter;
}
