   TITLE template           (template.asm)                     (special.asm)
 
;This  
;Last updated 92.15.2016 Written by dr scheiman
INCLUDE Irvine32.inc
.data
msg byte "eax == 5", 0
.code
main PROC  
mov edx, offset msg
mov eax, 10
mov ecx, 5

loopy:
   dec eax
   call writedec
   call crlf
   .if(eax == 5)
   call writestring
   .endif
loop loopy 

mov eax, 10
.while eax > 5
dec eax
call writedec
.if(eax == 5)
call writestring
.endif
.endw  

mov eax, white + black * 16
call settextcolor
call writedec  

call clrscr

mov dl, 2
mov dh, 3
call gotoxy
mov al, '*'
call writechar  
        exit
	 
main ENDP

end main