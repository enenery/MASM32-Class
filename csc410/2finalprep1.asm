   TITLE template           (template.asm)                     (special.asm)
 
;This  
;Last updated 92.15.2016 Written by dr scheiman
INCLUDE Irvine32.inc
.data
msg byte "eax == ecx: ", 0
.code
main PROC  
mov eax, 0 
.while eax < 10
inc eax 
call writedec
call crlf
.endw  
mov edx, offset msg
mov eax, 3
mov ebx, 8
mov ecx, 5
.while eax < ebx
inc eax
.if eax == ecx
call writestring
.else
call writedec
.endif
call crlf
.endw  
        exit
	 
main ENDP

end main