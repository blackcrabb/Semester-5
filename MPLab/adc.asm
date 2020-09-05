;Addtion of Two 16 bit using ADC
 .MODEL SMALL

.DATA

    a DB 10,"Enter first value : $"
    b DB 10,"Enter second value : $",10
    sum DB 10,"Sum is : $",10

.code

m proc

    MOV AX,@DATA                                       
    MOV DS,AX
    
    MOV DX,OFFSET a                                
    MOV AH,09h
    INT 21h
    
    MOV AH,01
    INT 21h                                             
    MOV BH,AL                                          
    
    MOV AH,01h                                      
    INT 21h
    MOV BL,AL
    
    SUB BX,3030h                                       
    
    MOV DX,OFFSET b                             
    MOV AH,09h
    INT 21h
    
    MOV AH,01h                                        
    INT 21h
    MOV CH,AL
    
    MOV AH,01h                                   
    INT 21h
    MOV CL,AL
   
    SUB CX,3030h                                      
    
    MOV DX,OFFSET sum                           
    MOV AH,09h
    INT 21h
    
    MOV AH,0                                       
    MOV AL,BL
    ADD AL,CL                                     
    AAA                                       
    
    
    MOV BL,AL                                 
    ;MOV DH,AH                                        
    
    
    MOV AH,0                                        
    MOV AL,BH                                    
    ADC AL,CH
    AAA                                              
    ;ADD AL,DH                                      
    
    MOV CX,AX
    ADD CX,3030h
    
    MOV AH,02                                    
    MOV DL,CH                                      
    INT 21h
    
    MOV AH,02                                       
    MOV DL,CL                                                                               
    INT 21h    
    
    ADD BL,30h
    MOV AH,02
    MOV DL,BL
    INT 21h
    
    MOV AH,4CH
    INT 21H
    

m endp
end m