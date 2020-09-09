model small
.data

arr db 1,2,3,4,5 ;array declare

.code
m proc

mov ax,@data
mov ds,ax
lea si,arr
mov cx,5

output:
    mov dl,32 ;space
    mov ah,02h
    int 21h

    mov dl,[si] ;si is source
    add dl,30h

    mov ah,02h
    int 21h
    inc si  
loop output

m endp
end m