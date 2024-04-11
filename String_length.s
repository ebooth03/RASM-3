// Author  : Victor Ponce
// Program : Rasm-3 String Length Function
// Class   : CS3B
// Subroutine String_length
// @param  X0 : Points to a null terminted string
// @return X0 : Size of string
// @ All AAPCS registers are preserved,  r19-r29 and SP.

   .data

	.global String_length

	.text
String_length:
	// Save registers
	STP	X19, X20, [SP, #-16]!	// Push X19 and X20 to the stack
	STP	X21, X22, [SP, #-16]!	// Push X21 and X22 to the stack
	STP	X23, X24, [SP, #-16]!	// Push X23 and X24 to the stack
	STP	X25, X26, [SP, #-16]!	// Push X25 and X26 to the stack
	STP	X27, X28, [SP, #-16]!	// Push X27 and X28 to the stack
	STP	X29, X30, [SP, #-16]!	// Push X29 and X30 to the stack

	// Initialize LCV to 0 (LCV == X0)
	MOV	X19, X0			// Move address of string into X19
	MOV	X20, #0			// Set X20 as LCV = 0

loop:
	LDRB	W21, [X19], #1		// Load whats at X19 into W21 and increment pointer
	CMP	W21, #0			// Compare W21 to 0
	BEQ	end			// If W21 == 0 then its a null terminator jump to end
	ADD	X20, X20, #1		// Else add 1 to the counter, meaning theres a character
	B 	loop			// Branch back to loop

end:
	MOV	X0, X20 		// Move LCV (counter) into X0 (LCV has length of string)

	LDP	X29, X30, [SP], #16	// Pop X29 and X30 off the stack
	LDP	X27, X28, [SP], #16	// Pop X27 and X28 off the stack
	LDP	X25, X26, [SP], #16	// Pop X25 and X26 off the stack
	LDP	X23, X24, [SP], #16	// Pop X23 and X24 off the stack
	LDP	X21, X22, [SP], #16	// Pop X21 and X22 off the stack
	LDP	X19, X20, [SP], #16	// Pop X19 and X20 off the stack

	// Return
	RET	LR
	.end
