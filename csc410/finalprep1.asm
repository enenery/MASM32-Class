   TITLE template           (template.asm)                     (special.asm)
 
;This  
;Last updated 92.15.2016 Written by dr scheiman
INCLUDE Irvine32.inc
.data

.code
main PROC  
 call randomize
mov ecx, 199
loopy:
 mov eax, 342
call randomrange
add eax, 59
call writedec
mov al, ' '
call writechar
loop loopy
      
        exit
	 
main ENDP

end main