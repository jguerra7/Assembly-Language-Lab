; Student Name: MINGJIE SHAO
; Student ID: C00188468
; Date: 08/12/2015
; Description:
;    Write a program that will:
;    Declare a memory variable called mynum
;    (Use DB when declaring the memory variable.)
;    Take in a number (using the procedure INDEC – this will store the number in AX).
;    Copy the value in AX into the memory variable called mynum
;    Print out the value that is in the memory variable mynum as a decimal number (use the procedure OUTDEC).

title WEEK11B.ASM
.model small
.stack 100h

.data
  mynum dw 0

.code
  extrn indec: proc
  extrn outdec: proc
  mov ax, @data
  mov ds, ax
  call indec    ; input a decimal number
  mov mynum, ax
  mov mynum, dx
  call outdec    ; print out the decimal number

finish:
  mov ah, 4ch
  int 21h
end
