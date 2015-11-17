; Author: MINGJIE SHAO
; Date: 17/11/2015
; Description: Write a program that will
;             -Read in a number(make sure you call indec to do this)
;             -Check the number against the value 100
;             -If it is < 100 print the message "No entered < 100"
;             -If it is > 100 print the message "No entered > 100"
;             -If it is = 100 print the message "No entered = 100"

title WEEK91.ASM
.model small
.stack 100h

.data
    string1 db 'No entered < 100',13,10,'$'
    string2 db 'No entered > 100',13,10,'$'
    string3 db 'No entered = 100',13,10,'$'

.code
    mov ax, @data
    mov ds, ax
    extrn indec: proc

    call indec
    cmp ax, 100
    ja lt100
    jb gt100
    je eq100
    jmp finish

gt100:
    mov ah, 09h
    mov dx, offset string1
    int 21h
    jmp finish
lt100:
    mov ah, 09h
    mov dx, offset string2
    int 21h
    jmp finish
eq100:
    mov ah, 09h
    mov dx, offset string3
    int 21h
    jmp finish

finish:
    mov ah, 4ch
    int 21h
end    
