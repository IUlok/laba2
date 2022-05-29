include io.asm
.model small
.stack 100
.data
  array db 100 dup(?)
.code
.startup
start:
      InInt bx
      xor si, si
      mov cx, bx
starting:
      mov ah,01h
      int 21h
      cmp al,' '
      je probel
      jne ifelse
probel:
      jmp cycle
ifelse:
      mov array[si],al
      inc si
      jmp cycle
cycle:
      loop starting
      mov array[si], '$'
      newline
      mov ah, 9
      lea dx, array
      int 21h
      .exit 0
end
