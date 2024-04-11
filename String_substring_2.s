// Author  : Victor Ponce
// Program : Rasm-3 String substring_2 Function
// Class   : CS3B
// Subroutine String_substring_2
// @param  X0 : Points to a null terminated string
// @param  X1 : Start Index
// @param  X2 : Pointer that has enought memory for string
// @return    : Stores substring in pointer that in is X2
// @ All AAPCS registers are preserved,  r19-r29 and SP.
	.data

	.global	String_substring_2

	.text
String_substring_2:
	// Push registers
	STP	X19, X20, [SP, #-16]! 	// Push X19 and X20 to the stack
	STP	X21, X22, [SP, #-16]! 	// Push X21 and X22 to the stack
	STP	X23, X24, [SP, #-16]! 	// Push X23 and X24 to the stack
	STP	X25, X26, [SP, #-16]! 	// Push X25 and X26 to the stack
	STP	X27, X28, [SP, #-16]! 	// Push X27 and X28 to the stack
	STP	X29, X30, [SP, #-16]! 	// Push X29 and X30 to the stack

	/*===== String_substring_1 =====*/
	MOV	X20, X1			// Move index into X20
loop:
	LDRB	W22, [X0, X20]		// Load a single byte from X0 into W22
	STRB	W22, [X2], #1		// Store a single byte from W22 into X2, than increment pointer
	CBZ	W22, end		// Check for end of string, if so branch to end

	ADD	X20, X20, #1		// Increment index
	B	loop			// Branch to loop

end:
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
