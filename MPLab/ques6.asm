.MODEL small

.DATA
input DB 10,"Enter a no.: $"
sum DB 10,"Sum is: $"

.CODE

m proc
MOV AX,@DATA

;first input
MOV DS,AX
MOV AH,9h
MOV DX,OFFSET input
INT 21H

MOV AH,1h
INT 21H

;store first no
MOV BX,AX
SUB BX,30h

;second input
MOV AH,9h
MOV DX,OFFSET input
INT 21H

MOV AH,1h
INT 21H

;store secondno.
SUB AX,30h

;add 
ADD BX,AX

CMP BX,9h   ;compare
jg l1 ; jump if greater than compared value
ADD BX,30h
jmp l2  ; jump if less than 
l1: ADD BX,37H ;definition of l1

l2: MOV DX,BX ;defination of l2
    MOV AH,2h
    INT 21H


MOV AH,4ch
INT 21H


m endp
end m

