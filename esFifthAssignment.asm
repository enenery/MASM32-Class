TITLE esFifthAssignment          

; Author: Erii Sugimoto 
; Date: 12/18/2016

INCLUDE Irvine32.inc

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

.data
prompt          BYTE             "Enter a string: ",0
message         BYTE             "You entered: ",0 
message2        BYTE             "The length of your string is: ",0
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
                ret 4				
memAlloc        ENDP

memFree         PROC
                enter            0,0

                INVOKE           GetProcessHeap
                INVOKE           HeapFree, eax, 0, [ebp+8]
				
                leave                
                ret 4 
memFree         ENDP 

main            PROC 
                push             offset prompt
                call             strqry
				
                mov              ebx, eax

                writeMessage     offset message
                writeMessage     eax
                
                call             crlf

                push             eax
                call             strlen
                
                writeMessage     offset message2               
                call             writedec

                push             ebx
                call             strrev
                
                call             crlf

                writeMessage     eax
call dumpregs				
                free             ebx
call dumpregs 				
                exit				
main            ENDP

                END              main	  	        