# Arrays and integer calculations
Омирбекова Дария БПИ-217

# Часть 1
- Приведено решение задачи на C.

- Из ассемблерной программы убраны лишние макросы за счет использования соответствующих аргументов командной строки:
```
gcc -O0 -Wall -masm=intel -S -fno-asynchronous-unwind-tables -fcf-protection=none main.c
```

- Модифицированная ассемблерная программа отдельно откомпилирована и скомпонована без использования опций отладки:

![](https://github.com/Raaazzy/--1-/blob/main/images/Assembler_code.png)

Для этого использовались команды:

```
# as --gstabs -o name.o name.s
# gcc name.o -o name
# ./name
```
- Представлено полное тестовое покрытие, дающее одинаковый результат на обоих программах. Приведены результаты тестовых прогонов для обоих программ, демонстрирующие эквивалентность функционирования:

Все тесты отработали корректно на обоих программах.

Результаты тестов программы без лишних макросов:

![](https://github.com/Raaazzy/--1-/blob/main/images/after_test1.png)
![](https://github.com/Raaazzy/--1-/blob/main/images/after_test2.png)
![](https://github.com/Raaazzy/--1-/blob/main/images/after_test3.png)
![](https://github.com/Raaazzy/--1-/blob/main/images/after_test4.png)


Результаты тестов программы c лишними макросами:

![](https://github.com/Raaazzy/--1-/blob/main/images/before_test1.png)
![](https://github.com/Raaazzy/--1-/blob/main/images/before_test2.png)
![](https://github.com/Raaazzy/--1-/blob/main/images/before_test3.png)
![](https://github.com/Raaazzy/--1-/blob/main/images/before_test4.png)

