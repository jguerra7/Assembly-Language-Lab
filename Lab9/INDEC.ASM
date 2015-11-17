; Description: INDEC assembly procedure. Inputs 16-bit unsigned decimal
; number into register AX
; Author: RP        Class:          Date: Feb. 1996

title indec.asm
.model small
BDOS   equ 21h
CR equ 0Dh
LF equ 0Ah
.stack 100h
.code

PUBLIC INDEC
INDEC   PROC    NEAR
	push    bx      ; Save registers
	push    cx
	push    dx
	xor bx,bx       ; Clear N
INDEC0: push    bx      ; Save N
	call    getc        ; Get next character
	pop bx      ; Restore N
	cmp al, '0'     ; < 0 ?
	jb  indec2      ; Yes
	cmp al, '9'     ; > 9 ?
	ja  indec2      ; Yes
	sub al, '0'     ; Get decimal digit
INDEC1: push    ax      ; Save digit
	mov ax, 10      ; Multiply N by 10
	mul bx
	mov bx, ax
	pop ax      ; Restore digit
	xor ah, ah
	add bx, ax      ; Add in digit
	jmp indec0      ; Get next digit
INDEC2: mov ax, bx      ; Return N in AX
	pop dx      ; Restore registers
	pop cx
	pop bx
	ret
INDEC   ENDP            ; Return to caller


GETC    PROC    NEAR
	push    bx
	push    cx
	push    dx
	mov ah, 01h
	int BDOS
	pop dx
	pop cx
	pop bx
	ret
GETC    ENDP
end

