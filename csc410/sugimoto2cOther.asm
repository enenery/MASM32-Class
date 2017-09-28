TITLE multisegments     (mseg.asm)

Comment @
Author : Eran Barak
Creation Date : Apr 7, 2016
@ 
  

Include Irvine32.inc
 
.data			 
	 
        array1 byte 1,' ', 1,' ', 1,'x', 1,' ' , 1,'x', 1,' ' 
	array2 byte 1,' ', 1,'x', 1,' ', 1,'x', 1,' ', 1,'x'
	array3 byte 1,' ', 1,'x', 1,' ', 1,'x', 1,' ', 1,'x'
	array4 byte 1,' ', 1,'x', 1,' ', 1,'x', 1,' ', 1,'x'
	array5 byte 1,' ', 1,'x', 1,' ', 1,'x', 1,' ', 1,'x'
      x byte 0
      y byte 0
      grandarray dword 10 dup(?)
      symbol byte ? 
                      l1 = lengthof array1/2
	l2 = lengthof array2/2
	l3 = lengthof array3/2
	l4 = lengthof array4/2
	l5 = lengthof array5/2
.code
main PROC
	
        call clrscr
        call creategrand
	
	mov ecx, 20
	movement:
		push ecx
		call createpicture
		mov eax, 200
		call delay
		inc x
		pop ecx
	loop movement	
          	   
		exit
main ENDP
             
drawline PROC
		 	      
        lineloop:
		  mov al,symbol
		  call writechar
	loop lineloop  
        ret
drawline ENDP

creategrand PROC
	
        mov esi, offset grandarray
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
       ret
  creategrand endp
    
printinit PROC
	
         mov eax, 0
         mov esi, grandarray[edi]     ;  offset
         mov ecx, grandarray[edi+4]   ; length
 
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

          call crlf
          add edi,8
          ret
printinit endp

createpicture PROC
	
        mov ecx,5
        mov edi,0
	mov dl, x
	mov dh, y	
        
        myint:
	    call gotoxy
            push ecx
            call printinit
            pop ecx
	    mov dl, x
	    inc dh
        loop myint
     	    ret

createpicture ENDP
END main



 