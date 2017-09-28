   TITLE sugimoto3a          (template.asm)                     (special.asm)
 
;This  
;Last updated 92.15.2016 Written by Erii Sugimoto
INCLUDE Irvine32.inc
.data

.code

main PROC

	call randomize
	mov ecx, 120

	loopy:
	   mov eax, 23
	   call randomrange  
   	   sub eax, 17
	   call writeint
	   mov al, ' '
	   call writechar
	loop loopy 

        exit
	 
main ENDP
 
end main