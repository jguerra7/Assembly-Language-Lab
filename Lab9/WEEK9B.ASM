; Author: RJ/RC    MAR '98
; Description: The following program reads a character from the user, and if
;              the character is lowercase, it outputs it in uppercase

title WEEK9B.ASM
.model small
    lowerA	equ	97
    lowerZ	equ	122
    space	equ	32
    CR		equ	13
    LF		equ	10

.stack 100h
.data
	entchar db	'Enter character: ','$'

.code
    mov ax, @data
    mov ds, ax

    mov ah, 9
    mov dx, offset entchar
    int 21h

    mov ah, 1	; Dos function call, input a character
    int 21h
    mov bl, al
    cmp bl, lowerA
    jb finish
    cmp bl, lowerZ
    ja finish
    sub bl, space

finish:
	mov dl, CR
	mov ah, 2
	int 21h
        mov dl, LF
	int 21h
	mov dl, bl
	int 21h

	mov ah, 4ch
	int 21h

end
