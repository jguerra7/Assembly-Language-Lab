; Author: MINGJIE SHAO
; Student ID: C00188468
; Date: 1/12/2015
; Description: Write a program that will keep reading in a number [use indec ].
;              Your loop will keep going until the user enters 0.
;              Keep a total of all numbers entered by the user inside the loop.


title WEEK10E.ASM
.model small
.stack 100h

.data

.code
    extrn indec: proc
    extrn outdec: proc
    mov cx, 0

input:
    call indec
    cmp ax, 0
    je finish
    add cx, ax
    jmp input

finish:
    mov ax, cx
    call outdec
    mov ah, 4ch
    int 21h
end
