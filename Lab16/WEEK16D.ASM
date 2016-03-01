; The following program inputs a list of 10 numbers, stores them in an array,
; and then outputs them in reverse order
; Authors: MINGJIE SHAO                Class: C2P                    Date: 1st March 2016

Title WEEK16D.ASM

.model small
.stack 100h
.data
        charlist db      10 dup(0)       ; declaration of 10 words
        command1   db   10,13,'Enter a charactor: ','$'
.code
	extrn	indec  : proc
	extrn	outdec : proc

        mov ax,@data
	mov	ds,ax		        ; sets up the data segment register ds
	mov	bx, offset command1 ; the start of the string in bx
        mov     cx,10               ; initialise counter to 10
	mov	si,0		        ; initialise array pointer , use si or di
indata: mov 	ah, 9
	mov	dx, bx
	int 21h                 ; output command1 string
        mov     ah, 01h
        int     21h
        mov     charlist[si],al      ; store the inputted number in the array
        add     si, 1                       ; update index to next element
	loop	indata          ; read in more numbers if cx > 0
        sub     si, 1                   ; initialise pointer to last element
        mov     cx, 10              ; start counter at 10 again
	mov     ah, 2
	mov	dl, 13
	int 21h                 ; output carriage return
	mov     ah, 2
	mov	dl, 10
	int 21h                 ; output linefeed
        mov     si, 0           ; initialise the si pointer
next:   mov     dl,charlist[si]  ; put next integer in the array into ax
	mov	ah, 2
        int     21h
	mov 	dl, ' '
	int 21h                 ; output a space character
    add     si,1                    ; move the index pointer to element below
	loop	next            ; go back to output more if cx > 0
	mov ah,4cH
	int 21H			        ; terminate program
end
