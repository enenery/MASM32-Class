   TITLE template           (template.asm)                     (special.asm)
 
;This  
;Last updated 92.15.2016 Written by dr scheiman
INCLUDE Irvine32.inc
.data

.code
main PROC  
 mov al, 'a'
and al, 65 
call writechar 
or al, 32
call writechar   
        exit
	 
main ENDP

end main