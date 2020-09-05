;Addtion of Two 16 bit(2 - digit)0 nubers with carry 
 .MODEL SMALL

.DATA

    a DB 10,"Enter first value : $"
    b DB 10,"Enter second value : $",10
    sum DB 10,"Sum is : $",10

.code

m proc

    MOV AX,@DATA                                       ;initialize data segment
    MOV DS,AX
    
    MOV DX,OFFSET a                                ;to display var 1
    MOV AH,09h
    INT 21h
    
    MOV AH,01
    INT 21h                                             ;starting me jo number aayega vo AL me hi aayega,to take the input higher byte of var1 from user
    MOV BH,AL                                          
    
    MOV AH,01h                                          ;to take the input lower byte of var1 from user
    INT 21h
    MOV BL,AL
    
    SUB BX,3030h                                       ;ek ek krrke no leke subtract nahi kiya , balki poora number leke fir ek baari me subtract kiya hai dono sahi hai
    
    MOV DX,OFFSET b                                ;to display var 2
    MOV AH,09h
    INT 21h
    
    MOV AH,01h                                        ;to take the input higher byte of var2 from user
    INT 21h
    MOV CH,AL
    
    MOV AH,01h                                         ;to take the input lower byte of var1 from user
    INT 21h
    MOV CL,AL
   
    SUB CX,3030h                                      ;convert ascii to binary,,,,, ek ek krrke no leke subtract nahi kiya , balki poora number leke fir ek baari me subtract kiya hai dono sahi hai
    
    MOV DX,OFFSET sum                                ;to display var 3
    MOV AH,09h
    INT 21h
    
    MOV AH,0                                          ;to clear ah bcz may be ah have already some garbage value in it so we've to clear it 
    MOV AL,BL
    ADD AL,CL                                         ;addition of lowerbytes
    AAA                                              ;ascii adjust, if sum of BL and CL goes above 9 so it will go  aaa add and givs answer in no 
    
    
    MOV BL,AL                                        ;store addition of lowerbytes in BL
    MOV DH,AH                                        ;store carry of lowerbyte addition in DH
    
    
    MOV AH,0                                         ;to clear ah bcz may be ah have already some garbage value in it so we've to clear it
    MOV AL,BH                                        ;addition of higher bytes
    ADD AL,CH
    AAA                                              ;ascii adjust, if sum of BL and CL goes above 9 so it will go  aaa add and givs answer in no
    ADD AL,DH                                        ;carry addition at the end
    
    MOV CX,AX
    ADD CX,3030h
    
    MOV AH,02                                         ;to display result
    MOV DL,CH                                         ;mov result in DL (higherbyte)
    INT 21h
    
    MOV AH,02                                         ;to display result
    MOV DL,CL                                          ;mov result in DL (lowerbyte)                                       
    INT 21h    
    
    ADD BL,30h
    MOV AH,02
    MOV DL,BL
    INT 21h
    
    MOV AH,4CH
    INT 21H
    

m endp
end m