; Student Name: MINGJIE SHAO
; Student ID: C00188468
; Date: 08/12/2015
; Description:
;    Write a program that will keep reading in a single number at a time until the user enters 0.
;    For example
;    User keys in:
;    15
;    25
;    30
;    40
;    0


title WEEK11C.ASM
.model small
.stack 100h

.data
  mynum dw 0

.code
  extrn indec: proc
  mov ax, @data
  mov ds, ax
input:
  call indec    ; input a decimal number
  mov mynum, ax
  cmp mynum, 0
  je finish
  jmp input

finish:
  mov ah, 4ch
  int 21h
end
