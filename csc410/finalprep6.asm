   TITLE template           (template.asm)                     (special.asm)
 
;This  
;Last updated 92.15.2016 Written by dr scheiman
INCLUDE Irvine32.inc
.data

.code
main PROC  
mov eax, 35
shl eax, 3
call writedec
call crlf
mov eax, 16
shr eax, 3
call writedec       
        exit
	 
main ENDP

end main