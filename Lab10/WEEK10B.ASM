; Author: MINGJIE SHAO
; Student ID: C00188468
; Date: 1/12/2015
; Description: Write a program that will keep reading
;              in a single character at a time. – Your
;              loop will keep doing this until the user
;              enters the charcter – lowercase q.

;              Check each character entered by the user inside your loop.
;              If the character is UPPERCASE print it out in lowercase.

title WEEK10B.ASM
.model small
.stack 100h

.data

.code
input:
    mov ah, 01h ; Input a character
    int 21h

    cmp al, 71h ; compare with lowercase 'q'
    je finish
    cmp al, 41h ; compare with uppercase 'A'
    jb input
    cmp al, 5ah ; compare with uppercase 'Z'
    ja input
    mov dl, al
    add dl, 20h ; uppercase converted to lowercase
    mov ah, 02h
    int 21h
    jmp input

finish:
    mov ah, 4ch
    int 21h
end
