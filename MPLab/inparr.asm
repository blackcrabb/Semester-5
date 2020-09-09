.MODEL SMALL

.DATA
size DB 10,'Enter size of array: $'
msg DB 10,'Enter array: $'
array1 DB 10 DUP(?) ;10 size and 0 inside
outp DB 10,'Output array is $'

.CODE

m proc
MOV AX,@DATA
MOV DS,AX
LEA DX,size
MOV AH,09H
INT 21H

MOV AH,01H
INT 21H
SUB AL,30H
MOV CL,AL

LEA DX,msg
MOV AH,09H
INT 21H

LEA si,array1
MOV CL,BL
l1:
    MOV dl,0AH ;endl
    MOV ah,02h
    int 21h
    
    MOV AH,01H
    INT 21H
    ;SUB AL,30H
    
    MOV [si],AL
    INC si
loop l1

LEA DX,outp
MOV AH,09H
INT 21H

MOV CL,BL
LEA si,array1
output:
    mov dl,32 ;space
    mov ah,02h
    int 21h

    mov dl,[si] ;si is source
    ;add dl,30h

    mov ah,02h
    int 21h
    inc si 
 loop output

m endp
end m
