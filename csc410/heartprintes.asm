   TITLE template           (template.asm)                     (special.asm)
 
;This  
;Last updated 92.15.2016 Written by dr scheiman
INCLUDE Irvine32.inc
.data

.code
main PROC
mov al, 9986
call writechar        
         
        exit
	 
main ENDP
 
end main