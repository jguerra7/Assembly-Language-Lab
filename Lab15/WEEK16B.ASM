; Student Name: MINGJIE SHAO
; Student ID: C00188468
; Date: 26/01/2016
; Description: Write a program to print the letters of the alphabet backwards.
;              You are to use the loop instruction to do this.
;              Program output:
;              ZYXW…A

title WEEK16A.ASM
.model small
.stack 100h

.code
    mov cx, 26    ; loop counter, print out Z-A
    mov dl, 5Ah   ; mov 'Z' to dl
    mov ah, 2     ; system call to print out
nextchar:
    int 21h
    sub dl, 1     ; mov to next char
    loop nextchar ; do loop

finish:
    mov ah, 4ch
    int 21h
end
