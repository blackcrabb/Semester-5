.MODEL small

.DATA
equal DB "They are equal $"
ne DB "They not equal $"

.CODE

m proc
MOV AX,@DATA
MOV DS,AX
MOV bl,2h
MOV al,3h

CMP bl,al
JE l1
JMP exit
l1: 
    MOV DX,OFFSET equal
    MOV AH,9
    int 21H
 
exit: MOV DX,OFFSET ne
    MOV AH,9
    int 21H
 

MOV AH,2


m endp
end m

