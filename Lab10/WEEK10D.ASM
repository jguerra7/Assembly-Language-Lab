; Author: MINGJIE SHAO
; Student ID: C00188468
; Date: 1/12/2015
; Description: Write a program that will keep reading in a number [use indec ].
;              Your loop will keep going until the user enters 0.


title WEEK10D.ASM
.model small
.stack 100h

.data

.code
    extrn indec: proc

input:
    call indec
    cmp ax, 0
    je finish
    jmp input

finish:
    mov ah, 4ch
    int 21h
end
