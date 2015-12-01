; Author: MINGJIE SHAO
; Student ID: C00188468
; Date: 24/11/2015
; Description: Write a program that will keep reading in a single     
;              character at a time. – Your loop will keep doing
;              this until the user enters the charcter - lowercase q.

title WEEK10A.ASM
.model small
.stack 100h

.data

.code
input:
    mov ah, 01h ; Input a character
    int 21h

    cmp al, 71h ; compare with lowercase 'q'
    je finish
    jmp input

finish:
    mov ah, 4ch
    int 21h
end
