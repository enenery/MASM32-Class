   TITLE simple bar zero    (simplebar2016z.asm)                     (special.asm)
 
;This  
;Last updated 92.15.2016 Written by dr scheiman
INCLUDE Irvine32.inc
.data
   countsA byte 0,0,0,0,0,0,0,0,0,0,0

  xs byte 3
  ys  byte 2
 n byte ?
.code
main PROC
      call clrscr 
      call printkey 
      call createCount 
      call graph

        exit
	 
main ENDP

createCount PROC
	
	call randomize
	mov ecx, 30
	mov ebx, 0
	mov esi, 0

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
	   add countsA[1], 1
	   .elseif(bl == 4)
	   add countsA[2], 1
	   .elseif(bl == 5)
	   add countsA[3], 1
	   .elseif(bl == 6)
	   add countsA[4], 1
	   .elseif(bl == 7)
	   add countsA[5], 1
	   .elseif(bl == 8)
	   add countsA[6], 1
	   .elseif(bl == 9)
	   add countsA[7], 1
	   .elseif(bl == 10)
	   add countsA[8], 1
	   .elseif(bl == 11)
	   add countsA[9], 1
	   .elseif(bl == 12)
	   add countsA[10], 1
	   .endif
	   inc esi
	   mov ebx, 0
	dec cx
	jne setCounts

	ret
createCount ENDP

graph proc
    mov xs, 3
    mov ys, 4
    mov dl, xs
    mov dh, ys
    mov esi, 0   
    mov ecx, 11

    bar:
     push ecx; draw line has its own ecx
 
      call gotoxy
      movzx eax, countsA[esi]
      mov n, al
	inc n
      call drawline

	 inc dl
         mov al, ' '
     	 call writechar
         inc dl
	 mov al, ' '
     	 call writechar
         inc dl

     	 pop ecx
     	 inc esi   ; next count element
	 mov dh, ys
    loop bar
     ret
graph endp
 

 printkey proc
     mov eax ,2
     mov ecx, 11
     mov dl,xs
     mov dh,ys
	
     printnum:
	push eax
         call gotoxy
         call writedec
         inc dl
	 mov al, ' '
     	 call writechar
         inc dl
	mov al, ' '
     	 call writechar
         inc dl
	pop eax
         inc eax
	
     loop printnum
    ret 
 printkey endp 
 
drawline proc
    movzx ecx, n
    mov al, '*'
    dline:
     call writechar
     inc dh
   loop dline
  ret
drawline endp


   dline:
     
end main