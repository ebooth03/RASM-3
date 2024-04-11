// Author  : Victor Ponce
// Program : Rasm-3 String equals Function
// Class   : CS3B
// Subroutine String_equals
// @param  X0 : Points to a null terminated string
// @param  X1 : Points to a null terminated string
// @return X0 : Boolean
// @ All AAPCS registers are preserved,  r19-r29 and SP.
	.data

	.global	String_equals

	.text
String_equals:
	// Push registers
	STP	X19, X20, [SP, #-16]! 	// Push X19 and X20 to the stack
	STP	X21, X22, [SP, #-16]! 	// Push X21 and X22 to the stack
	STP	X23, X24, [SP, #-16]! 	// Push X23 and X24 to the stack
	STP	X25, X26, [SP, #-16]! 	// Push X25 and X26 to the stack
	STP	X27, X28, [SP, #-16]! 	// Push X27 and X28 to the stack
	STP	X29, X30, [SP, #-16]! 	// Push X29 and X30 to the stack

	/*===== String_equals =====*/

	MOV	X19, #0			// Initialize LCV (index for strings)
mainLoop:
	LDRB	W20, [X0, X19]		// Load a byte from first string
	LDRB	W21, [X1, X19]		// Load a byte from second string
	CMP	W20, W21		// Compare W20 to W21
	BNE	unEqual			// Branch to unEqual if characters are not equal
	CBZ	W20, checkStringEnd	// Branch to checkStringEnd if end of string

	ADD	X19, X19, #1		// Increment pointer
	B	mainLoop		// Keep looping if characters are same

unEqual:
	MOV	X0, #0			// Move 0 into X0, meaning false
	B	end			// Branch to end

checkStringEnd:
	LDRB	W21, [X1, X19]		// Load a byte from second string
	CBZ	W21, equal		// If second string ended as well, than they are the same
	B	unEqual			// B to unEqual

equal:
	MOV	X0, #1			// Move 1 into X0, meaning true

end:
	/*===== String_equals =====*/

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
