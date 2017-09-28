   TITLE template           (template.asm)                     (special.asm)
 
;This  
;Last updated 92.15.2016 Written by Erii Sugimoto
INCLUDE Irvine32.inc
.data
array1 byte "Zip-a-dee-doo-dah, zip-a-dee-ay",0
array2 byte "My, oh my, what a wonderful day",0
array3 byte "Plenty of sunshine headin' my way",0
array4 byte "Zip-a-dee-doo-dah, zip-a-dee-ay",0
.code

main PROC

	call printout
   
        exit	 
main ENDP

printout PROC

	mov edx, offset array1
	call writestring
	call crlf
	mov edx, offset array2
	call writestring
	call crlf
	mov edx, offset array3
	call writestring
	call crlf
	mov edx, offset array4
	call writestring
	call crlf
		
	ret
printout ENDP
 
end main