.model small

.data
msg db 'loop from 0-9 $'

.code

m proc

mov ax, @data
mov ds, ax

lea dx, msg
mov ah, 9
int 21h

mov cx, 10

mov ah, 2
mov dl,48

l:
    int 21h
    inc dl
    loop l
 
mov ah,4ch
int 21h

m endp
end m