; Author: RC/RJ
; Date: Mar. 1998
; Description: Program to print out the string 'Hello, World'

title WEEK9A.asm
.model small
.stack 100h

.data
    Helomsg db 'Hello, World',13,10,'$'
 
.code
    mov ax, @data
    mov ds, ax

    mov ah, 09h
    mov dx, offset Helomsg
    int 21h

finish:
    mov ah, 4ch
    int 21h
end    
