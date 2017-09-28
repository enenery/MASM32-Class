 TITLE template           (template.asm)                     (special.asm)
 
;This  
;Last updated 92.15.2016 Written by Erii Sugimoto
INCLUDE Irvine32.inc
.data
array1 byte "Zip-a-dee-doo-dah, zip-a-dee-ay "
array2 byte "My, oh my, what a wonderful day "
array3 byte "Plenty of sunshine headin' my way "
array4 byte "Zip-a-dee-doo-dah, zip-a-dee-ay"
spacecounter dword 0
msg2 byte "The total number of words in the paragraph above: ", 0
.code

main PROC

	call converting
   	call countSpaces
	call printNumOfWords
        exit	 
main ENDP

converting PROC

	mov ecx, 129
	mov esi, 0
	loopying:
	mov al, array1[esi]
	or al, 32
	mov array1[esi], al
	call writechar
	inc esi
	loop loopying
	call crlf
	ret

converting ENDP
	
countSpaces PROC
	
	mov ecx, 129
	mov esi, 0

	loopy:
	  mov al, array1[esi]
	  .if(al == 32)
	  add spacecounter, 1
	  .endif
	  inc esi
	  loop loopy

	call crlf	
	
	ret	
countSpaces ENDP
 
printNumOfWords PROC
	mov edx, offset msg2
	call writestring
	mov eax, spacecounter
	inc eax
	call writedec
	ret
printNumOfWords ENDP 

end main