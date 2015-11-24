; Author: MINGJIE SHAO
; Student ID: C00188468
; Date: 24/11/2015
; Description:Accept a number from the user (use indec).
              If the number is greater than 1000 then 
                print the message “Your number is greater than 1000”
              Else 
                print the message “Your number is less than or equal to 1000”


title WEEK9D.ASM
.model small
.stack 100h

.data
    msg db 'Your number is greater than 1000',13,10,'$'
    msg2 db 'Your number is less than or equal to 1000', 13, 10, '$'
.code
    mov ax, @data
    mov ds, ax
    extrn indec: proc

    call indec
    cmp ax, 1000
    mov ah, 9
    jbe lessequal1000
    mov dx, offset msg
    int 21h
    jmp finish

lessequal1000:
    mov dx, offset msg2
    int 21h

finish:
    mov ah, 4ch
    int 21h

end
