# Arrays and integer calculations
Омирбекова Дария БПИ-217

### Часть 1
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
