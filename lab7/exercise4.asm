title exercise4
.model small
.stack 100h
.data

.code
    extrn outdec: proc
    mov ax, 0
nextNumber:
    add ax ,1
    call outdec
    cmp ax, 20
    jb nextNumber

finish:
    mov ah, 4ch
    int 21h
end
