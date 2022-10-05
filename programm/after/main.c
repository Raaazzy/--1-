#include <stdio.h>

#define max_size 1000


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
int main() {
  int A[max_size];
  int B[max_size];
  int length;
  // Ввод длины массива
  printf("Input length (0 < length <= %d): ", max_size);
  scanf("%d", &length);
  // Проверка длины массива на коррекность
  if(length < 1 || length > max_size) {
    printf("Incorrect length = %d\n", length);
    return 1;
  }
  // Заполнение массива
  for(int i = 0; i < length; ++i) {
    printf("Input A[%d]: ", i);
    scanf("%d", A + i);
  }
  // Вызов метода для извлечения из А положительных элементов в B
  int b_size = Task(A,length,B);
  // Вывод массива B
  printf("Result: ");
  for(int i = 0; i < b_size; ++i) {
    printf("%d ", B[i]);
  }
  printf("\n");
  return 0;
}
