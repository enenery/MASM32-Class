   TITLE simple bar zero    (simplebar2016z.asm)                     (special.asm)
 
;This  ;make it 3000 and fit in the screen
;Last updated 92.15.2016 Written by dr scheiman
INCLUDE Irvine32.inc
.data
   countsA dword 0,0,0,0,0,0,0,0,0,0,0

  xs byte 4
  ys  byte 3
  n dword ?
temp dword ?
num dword 0
.code
main PROC
call printkey 
      call clrscr 
      
     call createCount 
	call crlf 
	call crlf
	call clrscr

 	mov ecx, 11
	mov esi, 0
l1:
mov eax, countsA[esi]
call writedec
mov al, ' '
call writechar
add esi, 4
loop l1
    call graph
        exit
	 
main ENDP

createCount PROC
	
	call randomize
	mov ecx, 300000
	mov ebx, 0

	setCounts:

	   mov eax, 6
	   call randomrange
	   inc al
	   mov bl, al

	   mov eax, 6
	   call randomrange
	   inc al
	   add bl, al

	   .if(bl == 2)
	   add countsA[0], 1
	   .elseif(bl == 3)
	   add countsA[4], 1
	   .elseif(bl == 4)
	   add countsA[8], 1
	   .elseif(bl == 5)
	   add countsA[12], 1
	   .elseif(bl == 6)
	   add countsA[16], 1
	   .elseif(bl == 7)
	   add countsA[20], 1
	   .elseif(bl == 8)
	   add countsA[24], 1
	   .elseif(bl == 9)
	   add countsA[28], 1
	   .elseif(bl == 10)
	   add countsA[32], 1
	   .elseif(bl == 11)
	   add countsA[36], 1
	   .elseif(bl == 12)
	   add countsA[40], 1
	   .endif
	   mov ebx, 0
	dec cx
	jne setCounts

	ret
createCount ENDP

graph proc
    mov xs, 6
    mov ys, 3
    mov dl, xs
    mov dh, ys
    mov esi, 0
    
    mov ecx, 11
    bar:
     push ecx; draw line has its own ecx
 
      call gotoxy
 mov eax, countsA[esi]
      mov n, eax	
      call division
      call drawline
 
     pop ecx
      inc dh   ; next line
     add esi, 4   ; next count element
    loop bar
     ret
graph endp
 
 printkey proc
     mov eax, 2
     mov xs, 2
     mov ecx, 11
     mov dl,xs
     mov dh,ys

     printnum:
         call gotoxy
         call writedec
         inc dh
         inc al	
     loop printnum
    ret 
 printkey endp 
 
drawline proc
    mov ecx, n
    mov al, '*'
    dline:
     call writechar
   loop dline
  ret
drawline endp

division PROC

	mov eax, n
	mov ebx, 10
	div ebx
	mov temp, edx	
	mov n, eax
	.if(temp>=50)
	inc n
	.endif
	call crlf

	ret
division ENDP
    
end main