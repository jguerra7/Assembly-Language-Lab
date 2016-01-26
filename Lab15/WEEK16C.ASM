; Student Name: MINGJIE SHAO
; Student ID: C00188468
; Date: 26/01/2016
; Description: Write a program to print the first 10 letters of the alphabet.
;              You are to use the loop instruction to do this.
;              Program output:
;              

title WEEK16C.ASM
.model small
.stack 100h

.code
    extrn indec: proc

    call indec    ; input a numebr, stored in ax
    mov cx, ax    ; mov ax to cx loop counter
 
    mov ah, 2
    mov bx, cx
nextloop:
    mov cx, bx
printchar:
    mov dl, 2Ah
    int 21h       ; print out '*'
    loop printchar

    sub bx, 1
    mov cx, bx
    mov dl, 0ah
    int 21h
    loop nextloop
finish:
    mov ah, 4ch
    int 21h
end
