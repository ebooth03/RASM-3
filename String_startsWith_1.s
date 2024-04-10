// Author  : Victor Ponce
// Program : Rasm-3 String startWith_1 Function
// Class   : CS3B
// Subroutine String_startsWith_1
// @param  X0 : Points to a null terminated string
// @param  X1 : Index
// @param  X2 : substring
// @return    : Boolean
// @ All AAPCS registers are preserved,  r19-r29 and SP.
	.data

	.global	String_startsWith_1

	.text
String_startsWith_1:
	// Push registers
	STP	X19, X20, [SP, #-16]! // Push X19 and X20 to the stack
	STP	X21, X22, [SP, #-16]! // Push X21 and X22 to the stack
	STP	X23, X24, [SP, #-16]! // Push X23 and X24 to the stack
	STP	X25, X26, [SP, #-16]! // Push X25 and X26 to the stack
	STP	X27, X28, [SP, #-16]! // Push X27 and X28 to the stack
	STP	X29, X30, [SP, #-16]! // Push X29 and X30 to the stack

	/*===== String_copy =====*/
	MOV	X19, X0				// Move sz1 into X19
	MOV	X20, X2				// Move substring into X20

	MOV	X0, #1				// Set bool to true

loop:
	LDRB	W21, [X19, X1]		// Load a byte from X19 into W21
	LDRB	W22, [X20, X23]	// Load a byte from X20 into W22

	CBZ	W22, end				// If W22 is null branch to end

	CMP	W21, W22				// Compare W21 to W22
	BNE	mismatch				// If not equal than branch to mismatch

	ADD	X1, X1, #1			// Increment index for sz1
	ADD	X23, X23, #1		// Increment index for substring

	B		loop					// Branch to loop

mismatch:
	MOV X0, #0					// Set bool to false
	B end							// Branch to end

end:
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
