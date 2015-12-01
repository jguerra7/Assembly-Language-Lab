; Author: MINGJIE SHAO
; Student ID: C00188468
; Date: 24/11/2015
; Description: Write a program that  reads a character from the user.
;              If the character is UPPERCASE print it out in lowercase

title WEEK10.ASM
.model small
.stack 100h

.data

.code
    mov ah, 01h ; Input a character
    int 21h

    cmp al, 41h ; compare with uppercase 'A'
    jb finish
    cmp al, 5ah ; compare with uppercase 'Z'
    ja finish
    mov dl, al
    add dl, 20h ; uppercase to lowercase
    mov ah, 02h ; print character
    int 21h

finish:
    mov ah, 4ch
    int 21h
end
