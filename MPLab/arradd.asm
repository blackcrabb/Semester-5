.model small

.data
m1 DB 10, "Enter size of array: $"
m2 DB 10, "Enter array 1: $"
m3 DB 10, "Array 1 : $"
m4 DB 10, "Enter array 2: $"
m5 DB 10, "Array 2 : $"
m6 DB 10, "Sum : $"
arr1 DB 10 DUP(?)
arr2 DB 10 DUP(?)
sz DB 00H

.code

m proc

  MOV AX,@DATA
  MOV DS,AX

  LEA DX,m1               ;msg 1
  MOV AH,9H                  
  int 21H
  
  MOV AH,01              ;input size
  INT 21H
  SUB AL,30H
  
  MOV sz,AL               ; mov size to sz
  
  LEA DX,m2               ;msg 2
  MOV AH,9H                  
  INT 21H
  
  LEA SI,arr1     
  MOV CL,sz
  
  I1:                                ;loop for input arr1
   MOV AH,01
   INT 21H
   MOV arr1[SI],AL
   INC SI
   LOOP I1
   
 
  LEA DX,m4                          ;msg4
  MOV AH,9H                  
  int 21H
  
  LEA DI,arr2
  MOV CL,sz
              
  I2:                                ;input arr2
   MOV AH,01              
   INT 21H
   MOV arr2[DI],AL
   INC DI
   LOOP I2  
   
   MOV CL,sz
   LEA SI,arr1

   
   LEA DX,m3                          ;msg 3
   MOV AH,9H                    
   int 21H
   
   O1:                                 ;output arr1
    MOV DL,32
    MOV AH,02H
    INT 21H
  
    MOV DL,arr1[SI]
  
    MOV AH,02H
    INT 21H
    INC SI
    LOOP O1
 
  LEA DX,m5                           ;msg5
  MOV AH,9H                  
  int 21H
  
  MOV CL,sz
  LEA DI,arr2
 
  O2:                               ;output arr2
   MOV DL,32
   MOV AH,02H
   INT 21H
  
   MOV DL,arr2[DI]
  
   MOV AH,02H
   INT 21H
   INC DI
   LOOP O2
  
  LEA DX,m6               ;msg 6
  MOV AH,9H                  
  int 21H
  
  MOV CL,sz
  LEA SI,arr1
  LEA DI,arr2
  
  
  O3:
    MOV DL,32
    MOV AH,02H
    INT 21H
  
    MOV BL,arr1[SI]
    ADD BL,arr2[DI]
    SUB BL,30H
    
    MOV DL,BL  
    MOV AH,02H
    INT 21H
    
    INC SI
    INC DI
    LOOP O3
   
  MOV AH,4ch
  int 21H

m endp
end m