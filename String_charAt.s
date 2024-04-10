// Author  : Victor Ponce
// Program : Rasm-3 String charAt Function
// Class   : CS3B
// Subroutine String_charAt
// @param  X0 : Points to a null terminated string
// @param  X1 : Index
// @return    : Char in X0
// @ All AAPCS registers are preserved,  r19-r29 and SP.
	.data

	.global	String_charAt

	.text
String_charAt:
	// Push registers
	STP	X19, X20, [SP, #-16]! // Push X19 and X20 to the stack
	STP	X21, X22, [SP, #-16]! // Push X21 and X22 to the stack
	STP	X23, X24, [SP, #-16]! // Push X23 and X24 to the stack
	STP	X25, X26, [SP, #-16]! // Push X25 and X26 to the stack
	STP	X27, X28, [SP, #-16]! // Push X27 and X28 to the stack
	STP	X29, X30, [SP, #-16]! // Push X29 and X30 to the stack

	/*===== String_substring_1 =====*/
	MOV	X29, X0				// Move string into X29
	LDRB	W0, [X29, X1]		// Load a byte from X29 into W0 at index X1

	/*===== String_substring_1 =====*/

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
