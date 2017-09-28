   TITLE sugimoto3c          (template.asm)                     (special.asm)
 
;This  
;Last updated 92.15.2016 Written by Erii Sugimoto
INCLUDE Irvine32.inc
.data
source sdword ?
msg byte "Printing source array: ", 0
.code

main PROC
	
	mov edx, offset msg
	call writestring
	call crlf
	call randomize
	call createSource

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
	add esi, 4
loop loopy
	
	call printSource
 	ret

createSource ENDP

printSource PROC

	mov ecx, 120
	mov esi, 0
	
	print:
		mov eax, source[esi]
		call writeint
		mov al, ' '
		call writechar
		add esi, 4
	loop print
		ret

printSource ENDP
 
end main