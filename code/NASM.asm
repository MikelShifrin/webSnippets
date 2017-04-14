;Mikel Shifrin
;ID:40001737
;SOEN 228


section .data
;put your data in this section using
;db ,dw, dd directions

number db 5
answer db 1 ;1 means number is prime, 0 means number is not prime

section .bss

;put UNITIALIZED data here using

section .text
  global_start

_start:
  mov esi, number     ;get the offset of number into esi
keith: mov eax, 0     ;clear the entire eax register
  mov al, [esi]       ;get the number from memory into al
  mov dl, al          ;put it inside dl as well
  mov bl, 2           ;bl holds each divisor starting from 2
loopy: div bl
    and ax, 1111111100000000b ; isolate the rem in ah with a AND mask
                      ; to determine whether the remainder is 0
  cmp ax,0            ;compare ax with 0
  je there            ;if above condition is true jump to there
  inc bl              ;increment bl
  cmp bl, dl          ;compare bl with dl
  je done             ;if above condition is true jump to done
  mov eax, 0          ;clearing eax register setting it to 0
  mov al, [esi]       ;take the value esi points to and put into al
  jmp loopy           ;jump back to loopy

there: mov byte[answer], 0 ;set answer to 0

done:
mov eax,1             ; The system call for exit (sys_exit)
mov ebx,0             ; Exit with return code of 0 (no error)
int 80h
