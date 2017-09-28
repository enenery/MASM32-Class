   TITLE sugimoto3b          (template.asm)                     (special.asm)
 
;This  
;Last updated 92.15.2016 Written by Erii Sugimoto
INCLUDE Irvine32.inc
.data
source sdword ?
.code

main PROC

	call randomize

	mov ecx, 120
	mov esi, 0
loopy:
	mov eax, 23
	call randomrange  
	sub eax, 17
	mov source[esi], eax
	call writeint
	mov al, ' '
	call writechar
	add esi, 4
loop loopy 

        exit
	 
main ENDP
 
end main