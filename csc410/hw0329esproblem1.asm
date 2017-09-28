   TITLE colors          (template.asm)                     (special.asm)
 
;This  
;Last updated 92.15.2016 Written by Erii Sugimoto
INCLUDE Irvine32.inc
.data
msg1 byte "This is how to change the color of foreground in assembly.", 0
msg2 byte "This is how to change the color of background in assembly.", 0 
.code
main PROC

mov eax, 0
mov edx, offset msg1

mov ecx, 15
print1:
call crlf
inc eax
call settextcolor
call writestring
loop print1

mov eax, 0
mov edx, offset msg2
call crlf

mov ecx, 15
print2:
call crlf
add eax, 16
call settextcolor
call writestring
loop print2

mov eax, 15
call settextcolor
call crlf
   
         
        exit
	 
main ENDP
 
end main