include io.asm
.model small
.stack 100
.data
  array db 100 dup(?)
.code
DelProbel MACRO count, array
      xor si, si
      mov cx, bx
starting:
      mov ah,01h
      int 21h
      cmp al,' '
      jne ifelse
      jmp cycle
ifelse:
      mov array[si],al
      inc si
cycle:
      loop starting
      mov array[si], '$'
      newline
endm
.startup
start:
      InInt bx
      DelProbel bx, array
      mov ah, 9
      lea dx, array
      int 21h
      .exit 0
end
