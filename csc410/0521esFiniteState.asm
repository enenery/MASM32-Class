TITLE finitestates         (classproblem.asm)

;
;written by Erii Sugimoto

INCLUDE Irvine32.inc

.data
 
 count byte "the current state is s",0
 output byte "the output: ",0
 input1 byte "Please enter 0 or 1?",0
  


 
.code
main Proc
   call state0       
   exit
         
main ENDP
  

 
state0 proc
    mov edx,offset count ; 'the state is now'
    call writestring
    mov eax,0
    call writedec
    call crlf
    mov edx, offset output
    call writestring
	mov eax,0
   call WriteDec
    call crlf
   mov edx,offset input1
   call writestring
   call readint
   .if(eax==0)
     call state1
   .elseif(eax == 1)
     call state1
   .else
     exit
   .endif
   ret
state0 endp
 
state1 proc
   mov edx , offset count
   call WriteString
   mov eax,1
   call WriteDec
   call Crlf
   mov edx, offset output
 call WriteString
    mov EAX,1
   call WriteDec
   call Crlf
mov edx,offset input1
   call writestring
   call readint
   .if(eax==0)
     call state2
   .elseif(eax == 1)
     call state1
   .else
     exit
   .endif
   ret
state1 endp
   
state2 proc
   mov edx , offset count
   call WriteString
   mov eax,2
   call WriteDec
   call Crlf
   mov edx, offset output
   mov eax,0
   call WriteString
   call WriteDec
   call Crlf
mov edx,offset input1
   call writestring
   call readint
   .if(eax==0)
     call state2
   .elseif(eax == 1)
     call state0
   .else
     exit
   .endif
   ret
state2 endp




END main