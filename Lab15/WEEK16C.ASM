; Student Name: MINGJIE SHAO
; Student ID: C00188468
; Date: 26/01/2016
; Description: Before you wrote an assembly program to do the following:
;              -	Accept a number from the user
;              -	Print a pattern based on the number entered
;              E.g. user keys in 3
;              Program prints out
;              *
;              **
;              ***
;              E.g. user keys in 5
;              Program prints out
;              *
;              **
;              ***
;              ****
;              *****
;              Modify your program from last week so it uses the loop instruction to perform the inner and outer loops.             

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
    mov dl, 2Ah
printchar:
    int 21h       ; print out '*'
    loop printchar

    mov cx, bx
    dec bx
    mov dl, 0ah
    int 21h
    loop nextloop
finish:
    mov ah, 4ch
    int 21h
end
