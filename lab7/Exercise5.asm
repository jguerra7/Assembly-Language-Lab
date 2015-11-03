title exercise5
.model small
.stack 100h
.data

.code
    extrn outdec: proc
    mov ax, 0
nextNumber:
    add ax ,1
    call outdec ; print number
    mov cx, ax
    mov ah, 02h  ;functuin call
    mov dl, 10   ;new line
    int 21h      ;do it
    mov ax, cx
    cmp ax, 20
    jb nextNumber

finish:
    mov ah, 4ch
    int 21h
end
