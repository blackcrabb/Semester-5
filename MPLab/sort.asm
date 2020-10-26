.model small

.DATA
arr db 10 dup(?)
var1 db 10,"Enter the size of the array(max-9):$"
var2 db 10,"Enter the elements of array:(2-digit)$"
var3 db 10,"Elements of array:$"
var4 db "out$"
var5 db "in$"
size db

.code

m proc
    mov ax,@data
    mov ds,ax
    
    lea dx,var1
    mov ah,9h
    int 21h
    
    mov ah,1
    int 21h
    
    mov cl,al
    sub cl,30h
    mov size,cl
    
    lea dx,var2
    mov ah,9h
    int 21h
    
    lea si,arr
    mov bx,0
    
    input:
    mov ah,1h
    int 21h
    
    mov bl,al
    sub bl,30h
    shl bl,4
    
    mov ah,1h
    int 21h
    
    sub al,30h
    add bl,al
    
    mov dl,32
    mov ah,2h
    int 21h
    
    mov [si],bl
    inc si
    loop input
    
    mov cl,size
    calc:
    lea si,arr
    mov di,si
    inc di
    mov bl,cl
    
        sort:
        mov dh,[si]
        mov dl,[di]
        cmp dh,dl
        jb always
        
        mov [si],dl
        mov [di],dh
        
        always:
        inc si
        inc di
        dec bl
        cmp bl,01h
        jg sort
   loop calc
   
   lea dx,var3
    mov ah,9h
    int 21h
   
   lea si,arr
   mov bx,0
   mov dx,0
   mov cl,size
   output:
   mov bl,[si]
   inc si
   
   ror bl,4
   mov dl,bl
   and dl,0fh
   add dl,30h
   
   mov ah,2h
   int 21h
   
   ror bl,4
   mov dl,bl
   and dl,0fh
   add dl,30h
   
   mov ah,2h
   int 21h
    
   mov dl,32
   mov ah,2h
   int 21h
   loop output
   
   mov ah,4h
   int 21h
   
m endp
end m
   