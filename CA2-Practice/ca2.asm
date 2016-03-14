; Student Name: MINGJIE SHAO
; Student ID: C00188468
; Date: 13/03/2016

title ca2.asm
.model small
.stack 100h

.data
    charlist        db      5 dup(0)

.code
    mov         ax, @data
    mov         ds, ax

;=====Input five characters=====
    mov         cx, 5
    mov         si, 0
input:
    mov         ah, 01h
    int         21h
    mov         charlist[si], al
    add         si, 1
    loop        input

;=====Print out a space=====
    mov         ah, 02h
    mov         dl, ' '
    int         21h     

;=====Print out all characters=====
    mov         cx, 5
    mov         si, 0
print:
    mov         ah, 02h
    mov         dl, charlist[si]
    int         21h
    add         si, 1
    loop        print

;=====Print out a space=====
    mov         ah, 02h
    mov         dl, ' '
    int         21h     

;=====Print Uppercase=====
    mov         cx, 5
    mov         si, 0

printU:
    cmp         charlist[si], 'A'
    jb          notU
    cmp         charlist[si], 'Z'
    ja          notU

    mov         ah, 02h
    mov         dl, charlist[si]
    int         21h

notU:
    add         si, 1
    loop        printU

;=====Print out a space=====
    mov         ah, 02h
    mov         dl, ' '
    int         21h     

;=====Print out Lowercase in reverse order=====
    mov         cx, 5
    mov         si, 4

printL:
    cmp         charlist[si], 'a'
    jb          notL
    cmp         charlist[si], 'z'
    ja          notL

    mov         ah, 02h
    mov         dl, charlist[si]
    int         21h

notL:
    sub         si, 1
    loop        printL

;=====Exit program=====
    mov         ah, 4ch
    int         21h

end
