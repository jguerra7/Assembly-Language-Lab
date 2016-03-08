; Author: MINGJIE SHAO
; Student ID: C00188468
; Date: 08/03/2016
; Purpose: Usage of array.
title WEEK16E.ASM
.model small
.stack 100h

.data
    namelist        db      10 dup(0)       ; declear
    output      db      10, 13, 'Hello ', '$'
.code
    mov         ax, @data
    mov         ds, ax
    mov         cx, 10
    mov         si, 0                   ; Initialise the array pointer
input:                                  ; =========Loop==============
    mov         ah, 1                   ; enter a charactor
    int         21h
    mov         namelist[si], al            ; store the charactor into array
    add         si, 1
    loop        input                   ; =========Loop==============

    mov         dx, offset output
    mov         ah, 9
    int         21h
    mov         cx, 10
    mov         si, 0
    mov         ah, 2                   ; Print out a charactor
nextChar:
    mov         dl, namelist[si]
    int         21h
    add         si, 1
    loop        nextChar
finish:
    mov         ah, 4ch
    int         21h
end
