; Author: MINGJIE SHAO
; Student ID: C00188468
; Date: 24/11/2015
; Description:If the number is greater than 1000 then 
                print the message    “Your number is greater than 1000”
              Else
                If the number is less than 1000 then 
                  print the message “Your number is less than 1000”
                Else 
                  print the message “Your number is equal to 1000”


title WEEK9E.ASM
.model small
.stack 100h

.data
    msg1 db 'Your number is greater than 1000',13,10,'$'
    msg2 db 'Your number is less than 1000', 13, 10, '$'
    msg3 db 'Your number is equal to 1000', 13, 10, '$'
.code
    mov ax, @data
    mov ds, ax
    extrn indec: proc

    call indec
    cmp ax, 1000
    mov ah, 9
    jb less100
    je equal1000
    mov dx, offset msg1
    int 21h
    jmp finish

equal1000:
    mov dx, offset msg3
    int 21h
    jmp finish

less100:
    mov dx, offset msg2
    int 21h
finish:
    mov ah, 4ch
    int 21h

end
