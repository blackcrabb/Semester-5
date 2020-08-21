.MODEL small

.DATA
var1 DB 10,"Enter a value: $" ;10 for new line
var2 DB 10,"Entered value is: $"

.CODE

m proc

;print var1
MOV AX,@DATA
MOV DS,AX
MOV DX,OFFSET var1
MOV AH,9h
int 21H

;take input
MOV AH,1h
int 21H

;print var2
MOV DX,OFFSET var2
MOV AH,9h
int 21H

;print input taken
MOV DL,AL
MOV AH,2h
INT 21H

m endp
end m


