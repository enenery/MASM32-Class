   TITLE template           (template.asm)                     (special.asm)
 
;This  
;Last updated 92.15.2016 Written by Erii Sugimoto
INCLUDE Irvine32.inc
.data
source sdword ?
sum sdword 0
msg byte "The sum of the source array is ", 0
.code

main PROC

	mov edx, offset msg
	call writestring
call randomize
call createSource
call createSum

	mov eax, sum
	call writeint

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
 	ret

createSource ENDP

createSum PROC

	mov ecx, 120
	mov esi, 0
	
	addition:
		mov eax, source[esi]
		add sum, eax
		add esi, 4
	loop addition
		ret
createSum ENDP
 
end main