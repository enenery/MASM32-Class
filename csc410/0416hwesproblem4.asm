TITLE multisegments     (mseg.asm)

Comment @
Author : Erii Sugimoto
Creation Date : Apr 12, 2016
@ 
  

Include Irvine32.inc
 
.data			 
	 
      	array1 byte 1,' ',4,'x' ,2,' ',4,'x'  
	array2 byte 1,' ',1,'x' ,2,' ',1,'x',2,' ',1,'x'
	array3 byte 1,' ',4,'x' ,2,' ',4,'x'
	array4 byte 1,' ',1,'x' ,2,' ',1,'x',5,' ',1,'x'
	array5 byte 1,' ',1,'x' ,2,' ',1,'x',2,' ',4,'x'
	array6 byte 11,' '       
                      xstart byte 3
                      ystart byte 6
      grandarray dword 14 dup(?)
      symbol byte ? 
        l1 = lengthof array1/2
	l2 = lengthof array2/2
	l3 = lengthof array3/2
	l4 = lengthof array4/2
	l5 = lengthof array5/2
	l6 = lengthof array6/2
.code
	main PROC	; (insert executable instructions here)
         call clrscr
         call creategrand	
        mov ecx,10
       movement:
          push ecx
          call createpicture
         mov eax,200
        call delay
         inc ystart
         pop ecx
      loop movement	   
	exit
	main ENDP

     
              
	 drawline proc
              
              lineloop:
		  mov al,symbol
		  call writechar
	      loop lineloop  
         ret
         drawline endp

       creategrand proc
         mov esi, offset grandarray

	mov [esi], offset array6
         add esi,4
        mov eax,l6
         mov [esi], eax
        add esi,4

        mov [esi], offset array1
         add esi,4
         mov eax,l1
         mov [esi], eax
        add esi,4
     
       mov [esi], offset array2
         add esi,4
        mov eax,l2
         mov [esi], eax
        add esi,4

        mov [esi], offset array3
         add esi,4
          mov eax,l3
         mov [esi], eax
        add esi,4

        mov [esi], offset array4
         add esi,4
       mov eax,l4
         mov [esi], eax
        add esi,4

       mov [esi], offset array5
         add esi,4
        mov eax,l5
         mov [esi], eax
        add esi,4

	mov [esi], offset array6
         add esi,4
        mov eax,l6
         mov [esi], eax
        add esi,4

       ret
  creategrand endp
    
printinit proc 
          mov eax,0
        
          
          call gotoxy  
           mov esi,grandarray[edi]     
 
           mov ecx,grandarray[edi+4]
    
           reada1:
              push ecx
              mov al,[esi]
              mov ecx,eax
              inc esi
              mov al,[esi]
             mov symbol,al
              inc esi
             call drawline
              pop ecx
           loop reada1
           
          add edi,8
          ret
printinit endp

createpicture proc
      
      mov ecx,6
         mov edi,0
        mov dl,xstart
       mov dh,ystart
     
             myint:  
              call gotoxy
              push ecx
            call printinit
           pop ecx
           mov dl,xstart
          inc dh
           
       loop myint
      ret
createpicture endp
END main



 