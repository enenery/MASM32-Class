   TITLE template           (template.asm)                     (special.asm)
 
;This  
;Last updated 92.15.2016 Written by Erii Sugimoto
INCLUDE Irvine32.inc
.data
source sdword ?
sum sdword 0
backsource sdword ?
msg1 byte "The first paragraph is source array and the second one is backsource array:", 0

.code

main PROC
	mov edx, offset msg1
	call writestring
	call crlf

	call randomize
	call createSource
	
	call crlf
	call createBackSource

        exit	 
main ENDP

createSource PROC

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
	
	call crlf

 	ret
createSource ENDP

createBackSource PROC
	mov ecx, 120
	mov esi, 0
	
	movingout:
	   mov eax, source[esi]
	   push eax
	   add esi, 4
	loop movingout
	
	mov ecx, 120
	mov esi, 0
	
	movingin:
	   pop eax
	   mov backsource[esi], eax
	   add esi, 4
	loop movingin

	mov ecx, 120
	mov esi, 0
 
        print2:
	   mov eax, backsource[esi]
	   call writeint
	   mov al, ' '
	   call writechar
	   add esi, 4
	loop print2
	
	ret
createBackSource ENDP
 
end main