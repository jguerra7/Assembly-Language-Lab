; The following program inputs a list of 10 numbers, stores them in an array,
; and then outputs them in reverse order
; Authors: RC/RJ		Class: CNOC1			Date: March 1998

Title prog11.asm

.model small
.stack 100h
.data
	numlist	dw	10 dup(0)	; declaration of 10 words
	command1   db   10,13,'Enter an integer: ','$'
.code
	extrn	indec  : proc
	extrn	outdec : proc

	mov	ax,@data
	mov	ds,ax		        ; sets up the data segment register ds
	mov	bx, offset command1 ; the start of the string in bx
	mov	cx,10               ; initialise counter to 10
	mov	si,0		        ; initialise array pointer , use si or di
indata: mov 	ah, 9
	mov	dx, bx
	int 21h                 ; output command1 string
	call	indec           ; Read in an integer
	mov	numlist[si],ax	    ; store the inputted number in the array
	add	si, 2			    ; update index to next element
	loop	indata          ; read in more numbers if cx > 0
	sub	si, 2		        ; initialise pointer to last element
	mov	cx, 10              ; start counter at 10 again
	mov     ah, 2
	mov	dl, 13
	int 21h                 ; output carriage return
	mov     ah, 2
	mov	dl, 10
	int 21h                 ; output linefeed
next:	mov	ax,numlist[si]  ; put next integer in the array into ax
	call	outdec          ; output the integer
	mov	ah, 2
	mov 	dl, ' '
	int 21h                 ; output a space character
	sub	si,2		        ; move the index pointer to element below
	loop	next            ; go back to output more if cx > 0
	mov ah,4cH
	int 21H			        ; terminate program
end

