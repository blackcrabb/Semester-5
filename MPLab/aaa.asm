.model small
.stack 100
.data

a db,"Enter First Value: $"
b db 10,"Enter Second value: $"
sum db 10, "Sum is: $"

.code

m proc

mov ax,@data
mov ds ,ax
mov ah,9        
           
lea dx,a                 ;print string var1
int 21h

mov ah,1                   ;input and conversion var1
int 21h
mov bl,al
sub bl,30h

mov ah,9                   ;print string var2
lea dx,b
int 21h

mov ah,1                    ;input and conversion var2
int 21h    
sub al,30h

mov ah,9                   ;print string sum
lea dx,sum
int 21h

add al,bl                    ;adding  
            
xor ah,ah                    ;clearing ah
aaa                          ;adjust after adding
add ax,3030h                 ;instead of add we can use or also

mov bx,ax
   
mov dl,bh                    ;print sum
mov ah,2                   
int 21h  

mov dl,bl                     ;print sum
mov ah,02h
int 21h

mov ah,4ch
int 21h

m endp
end m
 