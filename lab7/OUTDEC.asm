; Description: OUTDEC assembly procedure. Outputs 16-bit unsigned decimal
; number from register AX
; Author: RP        Class:          Date: Feb. 1996

title outdec.asm
.model small
BDOS   equ 21h
CR equ 0Dh
LF equ 0Ah
.stack 100h
.code

PUBLIC OUTDEC
OUTDEC   PROC    NEAR
		push    ax
		push    bx              ; Save registers
		push    cx
		push    dx
		xor     cl,cl           ; Initialise digit count
		mov     bx, 10          ; Set up divisor
OUTD1:  xor     dx, dx          ; Zero high order word of dividend
		div     bx              ; Divide by 10
		push    dx              ; Save remainder on stack
		inc     cl              ; Bump count
		cmp     ax, 0           ; Anything left ?
		ja      OUTD1           ; Yes, get next digit
		xor     ch, ch          ; Zero high order byte of count for loop
OUTD2:  pop     ax              ; Get a digit from stack
		add     al, '0'         ; Get character code from digit
		push    cx              ; Save cx
		call    putc            ; Output the digit
		pop     cx              ; Get cx back
		loop    outd2           ; loop 'till cl = 0
		pop     dx              ; Restore registers
		pop     cx              
		pop     bx
		pop     ax
		ret
OUTDEC  ENDP


PUTC    PROC NEAR
		push    ax
		push    bx              ; Save registers
		push    cx
		push    dx
		mov     dl, al
		mov     ah, 02h         ; Call OS function 2
		int     BDOS
		pop     dx
		pop     cx              ; Restore registers
		pop     bx
		pop     ax
		ret                     ; Return to caller
PUTC    ENDP


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
