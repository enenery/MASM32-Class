   TITLE template           (template.asm)                     (special.asm)
 
;This  
;Last updated 92.15.2016 Written by dr scheiman
INCLUDE Irvine32.inc
.data

.code
main PROC  
mov al, 'A'
or al, 32
call writechar
call crlf
mov al, 'a'
or al, 32
call writechar      
        exit
	 
main ENDP

end main