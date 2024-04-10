// Author  : Victor Ponce
// Program : Rasm-3 String copy Function
// Class   : CS3B
// Subroutine String_copy
// @param  X0 : Points to a null terminated string
// @param  X1 : Pointer that holds enough memory for string
// @return    : Copied string into dynamiclly allocated memory
//					 thats pointing to X1
// @ All AAPCS registers are preserved,  r19-r29 and SP.
	.data

	.global	String_copy

	.text
String_copy:
	// Push registers
	STP	X19, X20, [SP, #-16]! // Push X19 and X20 to the stack
	STP	X21, X22, [SP, #-16]! // Push X21 and X22 to the stack
	STP	X23, X24, [SP, #-16]! // Push X23 and X24 to the stack
	STP	X25, X26, [SP, #-16]! // Push X25 and X26 to the stack
	STP	X27, X28, [SP, #-16]! // Push X27 and X28 to the stack
	STP	X29, X30, [SP, #-16]! // Push X29 and X30 to the stack

	/*===== String_copy =====*/
loop1:
	LDRB	W2, [X0], #1			// Load a byte from X0 into W2, then increment pointer
	CBZ	W2, end1					// If end is reached branch to end1
	STRB	W2,[X1], #1				// Store a byte from W2 into X1, then increment pointer

	B	loop1							// Branch to loop1

end1:

	/*===== String_copy =====*/

	// Pop Registers
	LDP X29, X30, [SP], #16		// Pop X29 and X30 off the stack
	LDP X27, X28, [SP], #16		// Pop X27 and X28 off the stack
	LDP X25, X26, [SP], #16		// Pop X25 and X26 off the stack
	LDP X23, X24, [SP], #16		// Pop X23 and X24 off the stack
	LDP X21, X22, [SP], #16		// Pop X21 and X22 off the stack
	LDP X19, X20, [SP], #16		// Pop X19 and X20 off the stack

	// Return
	RET	LR
	.end
