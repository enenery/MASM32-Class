   TITLE template           (template.asm)                     (special.asm)
 
;This  
;Last updated 92.15.2016 Written by dr scheiman
INCLUDE Irvine32.inc
.data
val word 8
.code
main PROC  
mov eax, 0
  mov eax, 'b'
  and eax,  66
  call writechar  

mov al, 'R'
or al, 32
call writechar 
call crlf

mov al, 10111011b
and al, 01110110b
call writebin 
call crlf

mov al, 10110011b
or al, 00101100b
call writebin
call crlf

mov al, 10011100b
xor al, 01011011b
call writebin
call crlf

mov eax, 24
shl eax, 1
call writedec
call crlf

mov eax, 3
shl eax, 3
call writedec
call crlf

mov eax, 24
shr eax, 2
call writedec
call crlf

mov eax, 32
shr eax, 4
call writedec
call crlf

mov eax, 10110110b
add eax, 10110011b
call writebin
call crlf

mov ax, 35
mul val
call writedec
call crlf

mov eax, 35
shl eax, 3
call writedec
call crlf

mov eax, 35
mov ecx, 7
multi:
   add eax, 35
loop multi
call writedec
call crlf

mov eax, 512
shr eax, 8
mov bx, ax
movzx eax, bx
call writedec
        exit
	 
main ENDP

end main