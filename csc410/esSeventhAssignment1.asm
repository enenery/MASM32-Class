TITLE esSeventhAssignment          

; Author: Erii Sugimoto 
; Date: 12/21/2016

INCLUDE Irvine32.inc

NODE            STRUCT
                info             DWORD   ? 
                next             DWORD   ?
NODE            ENDS

HANDLE          TEXTEQU          <DWORD>

GetProcessHeap  PROTO

HeapAlloc       PROTO,
                hHeap:HANDLE,
                dwFlags:DWORD,
                dwBytes:DWORD
				
HeapFree        PROTO,
                hHeap:HANDLE,
                dwFlags:DWORD,
                lpMem:DWORD
				
free            MACRO            address
                push             address
                call             memFree				
                ENDM				

alloc           MACRO            sizee
                push             sizee
                call             memAlloc
                ENDM

calloc          MACRO            sizee
                mov              al, sizee
                mov              bl, byte 
                mul              bl 
                push             ax 
                call             memAlloc
                ENDM

ialloc          MACRO            sizee               
                mov              ax, sizee
                mov              bx, word
                mul              bx 
                push             ax 
                call             memAlloc
                ENDM

lalloc          MACRO            sizee
                mov              eax, sizee
                mov              ebx, dword
                mul              ebx 
                push             eax 
                call             memAlloc
                ENDM

swap            MACRO            a, b
                mov              al, [a]
                mov              ah, [b]
			    
                xor              al, ah
                xor              ah, al
                xor              al, ah
                
                mov              [b], ah
                mov              [a], al				
                ENDM
				
writeMessage    MACRO            a               
                mov              edx, a
                call             writeString
                ENDM				
				
printinfo       MACRO            ref
                push             eax
                mov              eax, (Node PTR[ref]).info
                call             writedec
                call             crlf
                pop              eax
                ENDM
					
.data
prompt          BYTE             "Enter a string: ",0
message         BYTE             "You entered: ",0 
message2        BYTE             "The length of your string is: ",0
head            DWORD            0
.code

strqry          PROC
                enter            10,0               
                push             edx 
                push             ebx				
                push             ecx
                mov              edx, [ebp+8]
                call             writeString

                calloc           10				
                mov              ebx, eax
                mov              edx, ebx
                mov              ecx, 50
                call             readString

                mov              eax, ebx

                pop              ecx
                pop              ebx
                pop              edx
                leave
                ret              4
strqry          ENDP

strlen          PROC
                enter            0,0              
                push             ebx            
                push             ecx  
              
                mov              eax, 0          
                
                mov              ebx, [ebp+8]
                mov              cl, [ebx]                          
                cmp              cl, 0
                jne              L

L:              inc              eax
                inc              ebx
                mov              cl, [ebx]
                cmp              cl, 0
                jne              L

                pop              ecx
                pop              ebx
                leave
                ret              4
strlen          ENDP

strrev          PROC
                enter            0, 0                               
                push             edx
                push             edi
                push             esi
               
                push             [ebp+8]
                call             strlen
                dec              eax

                mov              edi, [ebp+8]
                add              edi, eax
                mov              esi, [ebp+8]              
                             				
                cmp              esi, edi
                jl               L
 
L:              swap             edi, esi
	  				                     			  
                inc              esi
                dec              edi			  
                cmp              esi, edi
                jl               L

                mov              eax, [ebp+8]
		        
                pop              esi
                pop              edi 				
                pop              edx
                leave  
                ret              4
strrev          ENDP

memAlloc        PROC
                enter            0,0

                INVOKE           GetProcessHeap
                INVOKE           HeapAlloc, eax, 8, [ebp+8]
				
                leave                
                ret              4				
memAlloc        ENDP

memFree         PROC
                enter            0,0

                INVOKE           GetProcessHeap
                INVOKE           HeapFree, eax, 0, [ebp+8]
				
                leave                
                ret              4 
memFree         ENDP 
				
makenode        PROC
                enter            0, 0
                push             ebx
								
                mov              ebx, [ebp+8]
                alloc            sizeOf NODE
                mov              (NODE PTR[eax]).info, ebx
                mov              (NODE PTR[eax]).next, 0
				
                pop              ebx
                leave
                ret              4             
makenode        ENDP

appendnode      PROC
                enter            0,0
                push             esi
                push             edi
                push             ebx
			
                mov              esi, [ebp+12]    			
                mov              edi, [ebp+8]     
                mov              ebx, [esi]
				
                cmp              ebx, 0
                jne              L1
                je               FirstNode
                
FirstNode:      mov              [esi], edi 
                jmp              L3

L1:             cmp              (NODE PTR[ebx]).next, 0                
                je               FoundLastNode
				
L2:             mov              ebx, (NODE PTR[ebx]).next 
                jmp              L1            
 
FoundLastNode:  mov              (NODE PTR[ebx]).next, edi 
                				 
L3:             pop              ebx
                pop              edi
                pop              esi
                leave 
                ret              8
appendnode      ENDP

printList       PROC
                enter            0,0
                push             esi 				
                mov              esi, [ebp+8]
				
L1:             cmp              esi, 0
                je               L3
                jmp              L2
               	            
L2:             printinfo        esi				
                mov              esi, (NODE PTR[esi]).next				
                jmp              L1
				
L3:             pop              esi 
                leave
                ret              4
printList       ENDP

makeList        PROC
                enter            0, 0
                push             edi
                push             esi
				  
                mov              esi, [ebp+12]
                mov              edi, [ebp+8]  				
                cmp              edi, 0
                jg               L1
                jmp              L2
              
L1:             push             edi  				
                call             makenode 
				
                push             esi 
                push             eax 
                call             appendnode
				
                dec              edi
                cmp              edi, 0 
                jg               L1
				                                  
L2:             pop              esi
                pop              edi 
                leave           
                ret              8
makeList        ENDP				
                				
main            PROC 				
                push             offset head
                push             10
                call             makeList  

                push             head
                call             printList	              				
                exit				
main            ENDP
                END              main