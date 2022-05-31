include io.asm
.model small
.stack 100
.data
  array db 100 dup(?)
  msg db "Enter array: ", 0Ah, 0Dh, '$'
  msg1 db "Enter size of array: ", 0Ah, 0Dh, '$'
.code
DelProbel MACRO count, array    ; Макроопределение
      xor si, si                ; Обнуление счетчика si
      mov cx, bx                ; Помещение длины строки в cx
starting:                       ; Метка starting
      mov ah,01h                ;]
      int 21h                   ;] - Ввод символа с клавиатуры
      cmp al,' '                ; Сравнение символа с пробелом
      jne ifelse                ; Если не пробел - переход на метку ifelse
      jmp cycle                 ; Иначе (т.е. если пробел) - переход на метку cycle
ifelse:                         ; Метка ifelse
      mov array[si],al          ; Запись текущего символа в массив по индексу текущего значения si
      inc si                    ; Увеличение счетчика на 1
cycle:                          ; Метка cycle
      loop starting             ; Новая итерация цикла
      mov array[si], '$'        ; Запись нулевого байта в конец строки
      newline                   ; Перенос строки
endm                            ; Конец макроса
.startup                        ;]
start:                          ;] - Начало программы
      mov ah, 9                 ;]
      lea dx, msg1              ;] - Вывод на экран msg1
      int 21h                   ;]
      InInt bx                  ; Ввод длины строки
      mov ah, 9                 ;]
      lea dx, msg               ;] - Вывод на экран msg
      int 21h                   ;]
      DelProbel bx, array       ; Вызов макроса
      mov ah, 9                 ;]
      lea dx, array             ;] - Вывод на экран строки
      int 21h                   ;]
      .exit 0                   ;]
end                             ;] - Конец программы
