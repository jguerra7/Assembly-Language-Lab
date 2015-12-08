; Student Name: MINGJIE SHAO
; Student ID: C00188468
; Date: 08/12/2015
; Description:
;    Write a program that will:
;    Declare a memory variable called myvar.
;    (Use DB when declaring the memory variable.)
;    Take in a single character (function call 01h) – ASCII value ;    for character is stored in the register AL.
;    Copy the ASCII value from AL into the memory variable called myvar.
;    Print out the value that is in the memory variable myvar as an ASCII character.


title WEEK11A.ASM
.model small
.stack 100h

.data
  myvar db 0

.code
  mov ax, @data
  mov ds, ax
  mov ah, 01    ; function call -> input a character
  int 21h
  mov myvar, al
  mov ah, 02    ; function call -> output a character
  mov dl, myvar
  int 21h

finish:
  mov ah, 4ch
  int 21h
end
