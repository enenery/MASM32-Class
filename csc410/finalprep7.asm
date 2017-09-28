   TITLE template           (template.asm)                     (special.asm)
 
;This  
;Last updated 92.15.2016 Written by dr scheiman
INCLUDE Irvine32.inc
.data

.code
main PROC  
 call multiply        
        exit
	 
main ENDP
multiply PROC
   mov ecx, 7
   mov eax, 35
   
   loopy:
   add eax, 35
   loop loopy
   call writedec
   ret
multiply ENDP 
end main