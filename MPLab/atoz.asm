.model small

.data
msg db 'loop from a-z $'

.code

m proc

mov ax, @data
mov ds, ax

lea dx, msg
mov ah, 9
int 21h

mov cx, 26

mov ah, 2
mov dl,41h

l:
    int 21h
    inc dl
    loop l
 
mov ah,4ch
int 21h

m endp
end m