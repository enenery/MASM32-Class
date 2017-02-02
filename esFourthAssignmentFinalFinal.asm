TITLE esFifthAssignment          

; Author: Erii Sugimoto 
; Date: 11/01/2016

INCLUDE Irvine32.inc

swap            MACRO            a, b

                mov              al, [a]
                mov              ah, [b]
			    
                xor              al, ah
                xor              ah, al
                xor              al, ah
                
                mov              [b], ah
                mov              [a], al				
				
                ENDM

.data

prompt          BYTE             "Enter a string: ",0
message         BYTE             "You entered: ",0 
message2        BYTE             "The length of your string is: ",0
response        BYTE             20 DUP (0)

.code

strqry          PROC
                push             ebp
                mov              ebp, esp
                
                push             edx            
                push             ecx

                mov              edx, [ebp+8]
                call             writeString

                mov              edx, offset response
                mov              ecx, sizeof response
                call             readString

                mov              eax, offset response

                pop              ecx
                pop              edx
                pop              ebp

                ret              4

strqry          ENDP

strlen          PROC

                push             ebp
                mov              ebp, esp  
              
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
                pop              ebp

                ret              4

strlen          ENDP

strrev          PROC
                
                push             ebp
                mov              ebp, esp              
                push             edx
                push             edi
                push             esi
               
                push             [ebp+8]
                call             strlen
                dec              eax

                mov              edi, [ebp+8]
                add              edi, eax
                mov              esi, [ebp+8]              
                             
                swap             edi, esi
								
		inc              esi
	        dec              edi
				
	        cmp              esi, edi
		jnae             L
 
L:       	swap             edi, esi		  				                     			  
                inc              esi
	        dec              edi
			  
	        cmp              esi, edi
		jnae             L

                mov              eax, [ebp+8]
		
                pop              esi
                pop              edi                
                pop              edx
                pop              ebp
  
                ret              4

strrev          ENDP


main            PROC 

                push             offset  prompt
                call             strqry

                mov              edx, offset message
		call             writeString

                mov              edx, eax
                call             writeString
                
                call             crlf

                push             eax
                call             strlen
                
                mov              edx, offset message2
                call             writeString

                call             writedec

		push             offset response
                call             strrev
                
                call             crlf

                mov              edx, eax
                call             writeString
   
        	exit
	 
main            ENDP

		END	 	 main