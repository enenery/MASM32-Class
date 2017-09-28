   TITLE template           (template.asm)                     (special.asm)
 
;This  
;Last updated 92.15.2016 Written by dr scheiman
INCLUDE Irvine32.inc
.data
count byte 0,0,0,0,0,0,0,0,0,0,0,0,0
heart byte 0,0,0,0,0,0,0,0,0,0,0,0,0
dimond byte 0,0,0,0,0,0,0,0,0,0,0,0,0
club byte 0,0,0,0,0,0,0,0,0,0,0,0,0
spade byte 0,0,0,0,0,0,0,0,0,0,0,0,0
var dword 64
.code
main PROC
mov eax, 1794
call writechar        
        exit
	 
main ENDP

end main