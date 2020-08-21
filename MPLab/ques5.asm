.MODEL small

.DATA
msg DB "sum is: $"

.CODE

m proc
MOV AX,@DATA
MOV DS,AX
MOV AH,9h
MOV DX,OFFSET msg
INT 21H

;and 3+5
MOV AL,3h
AND AL,5h
ADD AL,30h

MOV DL,AL
MOV AH,2h
INT 21H

MOV AH,4ch
int 21H

m endp
end m