; Author: MINGJIE SHAO
; Student ID: C00188468
; Date: 17/11/2015
; Description:Accept a number from the user (use indec).
;             If the number is greater than 1000 then 
;             print the message  “Your number is greater than 1000”

title WEEK9C.ASM
.model small
.stack 100h

.data
    msg db 'Your number is greater than 1000',13,10,'$'
.code
    mov ax, @data
    mov ds, ax
    extrn indec: proc

    call indec
    cmp ax, 1000
    jbe finish
    mov ah, 9
    mov dx, offset msg
    int 21h

finish:
    mov ah, 4ch
    int 21h

end
