.MODEL small

.DATA
var DB 10,"Enter a no. $"
.CODE

m proc

MOV AX,@DATA
MOV DS,AX
MOV DX,OFFSET var
MOV AH,9
int 21H

MOV AH,1h
INT 21H

SUB AL, 30h

SHL AL,1
ADD AL,30h
MOV dl,al
INT 21H

MOV AH,2h
INT 21H 

m endp
end m