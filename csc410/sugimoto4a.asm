   TITLE template           (template.asm)                     (special.asm)
 
;This  
;Last updated 92.15.2016 Written by Erii Sugimoto
INCLUDE Irvine32.inc
.data
msg byte "I created four arrays... ",0
array1 byte "Zip-a-dee-doo-dah, zip-a-dee-ay",0
array2 byte "My, oh my, what a wonderful day",0
array3 byte "Plenty of sunshine headin'  my way",0
array4 byte "Zip-a-dee-doo-dah, zip-a-dee-ay",0
.code

main PROC
 mov edx, offset msg
call writestring 
        exit	 
main ENDP
 
end main