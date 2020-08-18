.MODEL SMALL

.DATA
var DB "The Big Bang $"

.CODE
.STARTUP

    MOV AX,@DATA
    MOV DS,AX
    MOV DX,OFFSET var
    MOV AH,9
    int 21H
    
.EXIT
END