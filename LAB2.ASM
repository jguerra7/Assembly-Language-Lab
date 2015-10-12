title assesmen.asm

.model small
.stack 100h
.data

.code
    mov ah, 02h
    mov dl, 41h
nextchar:    int 21h

    mov dh, dl
    mov dl, 10
    int 21h

    mov dl, dh
    add dl, 1

    cmp dl, 4Ah
    jbe nextchar

finish:
    mov ax, 4C00h
    int 21h

end
