title test.asm

.model small
.stack 100h

.data

.code
    mov ah, 02h
    mov dl, 4Ah
    int 21h

finish: mov ax, 4C00h
    int 21h
end
