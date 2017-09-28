   TITLE template           (template.asm)                     (special.asm)
 
;This  
;Last updated 92.15.2016 Written by dr scheiman
INCLUDE Irvine32.inc
.data

.code
main PROC  
 mov eax, 8
 xor eax, 12
call writedec
call crlf

mov al, 'A'
or al, 32
call writechar 
call crlf

mov eax, 35
shl eax, 3
call writedec
call crlf 

mov ecx, 8
loopin:
sub eax, 35
loop loopin
call writedec
call crlf

mov eax, yellow + black*16
call settextcolor
call writedec

        exit
	 
main ENDP

end main