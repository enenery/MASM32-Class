   TITLE template           (template.asm)                     (special.asm)
 
;This  
;Last updated 92.15.2016 Written by Erii Sugimoto
INCLUDE Irvine32.inc
.data
array1 byte "Zip-a-dee-doo-dah, zip-a-dee-ay "
array2 byte "My, oh my, what a wonderful day "
array3 byte "Plenty of sunshine headin' my way "
array4 byte "Zip-a-dee-doo-dah, zip-a-dee-ay"
counter byte 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
warning byte "Counting letters for the paragraph below: ",0
msg byte 'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'
.code

main PROC

	mov edx, offset warning
	call writestring
	call crlf
	call converting
   	call countLetters
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
	
countLetters PROC
	
	mov ecx, 129
	mov esi, 0

	loopy:
	mov al, array1[esi]
	.if(al == 97)
	add counter[0], 1
	.elseif(al == 98)
	add counter[1], 1
	.elseif(al == 99)
	add counter[2], 1
	.elseif(al == 100)
	add counter[3], 1
	.elseif(al == 101)
	add counter[4], 1
	.elseif(al == 102)
	add counter[5], 1
	.elseif(al == 103)
	add counter[6], 1
	.elseif(al == 104)
	add counter[7], 1
	.elseif(al == 105)
	add counter[8], 1
	.elseif(al == 106)
	add counter[9], 1
	.elseif(al == 107)
	add counter[10], 1
	.elseif(al == 108)
	add counter[11], 1
	.elseif(al == 109)
	add counter[12], 1
	.elseif(al == 110)
	add counter[13], 1
	.elseif(al == 111)
	add counter[14], 1
	.elseif(al == 112)
	add counter[15], 1
	.elseif(al == 113)
	add counter[16], 1
	.elseif(al == 114)
	add counter[17], 1
	.elseif(al == 115)
	add counter[18], 1
	.elseif(al == 116)
	add counter[19], 1
	.elseif(al == 117)
	add counter[20], 1
	.elseif(al == 118)
	add counter[21], 1
	.elseif(al == 119)
	add counter[22], 1
	.elseif(al == 120)
	add counter[23], 1
	.elseif(al == 121)
	add counter[24], 1
	.elseif(al == 122)
	add counter[25], 1
	.endif
	inc esi
	dec cx
	jne loopy

	call crlf
	
	mov ecx, 26
	mov esi,0
	mov eax, 0
	
	print:
	mov al, msg[esi]
	call writechar
	mov al, ' '
	call writechar
	mov al, counter[esi]
	call writedec
	mov al, ' '
	call writechar
	inc esi
	call crlf
	loop print
	ret	
countLetters ENDP
 
end main