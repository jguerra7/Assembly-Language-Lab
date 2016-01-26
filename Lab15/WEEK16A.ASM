; Student Name: MINGJIE SHAO
; Student ID: C00188468
; Date: 26/01/2016
; Description: Write a program to print the first 10 letters of the alphabet.
;              You are to use the loop instruction to do this.
;              Program output:
;              ABCDEFGHIJ

title WEEK16A.ASM
.model small
.stack 100h

.code
    mov cx, 10    ; loop counter, print out A-J
    mov dl, 41h   ; mov 'A' to dl
    mov ah, 2     ; system call to print out
nextchar:
    int 21h
    add dl, 1     ; mov to next char
    loop nextchar ; do loop

finish:
    mov ah, 4ch
    int 21h
end
