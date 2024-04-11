// Author  : Victor Ponce
// Program : Lab 10
// Class   : CS3B
	.global	_start

	.equ	BUFFER, 21										// Buffer holds 21
	.equ	MAX_LEN, 20

	.data
// String Prompt for user
szPrompt1:		.asciz "Enter first string: "
szPrompt2:		.asciz "Enter second string: "
szPrompt3:		.asciz "Enter third string: "
sz1:				.skip BUFFER
sz2:				.skip BUFFER
sz3:				.skip BUFFER

// String_length
szStringLength1: .asciz "s1.length() = "
szStringLength2: .asciz "s2.length() = "
szStringLength3: .asciz "s3.length() = "
szLength:		 .skip BUFFER

// String_equals
szStringEqual:		.asciz "True"
szStringNotEqual:	.asciz "False"
szStringEqual1:	.asciz "String_equals(s1,s3) = "
szStringEqual2:	.asciz "String_equals(s1,s1) = "
szStringEqual3:	.asciz "String_equals(s1,s3) = "
szStringEqual4:	.asciz "String_equals(s1,s2) = "
// String_copy
szStringCopyMessage1:	.asciz "s4 = String_copy(s1)"
szStringCopyMessage2:	.asciz "s1 = "
szStringCopyMessage3:	.asciz "s4 = "
ptrString:	.quad 0

// String_substring_1
szStringSubstringMessage1: .asciz "String_substring_1(s3,4,14) = "
ptrString1:	.quad 0

// String_substring_2
szStringSubstringMessage2:	.asciz "String_substring_2(s3,7) = "
ptrString2: .quad 0

// String_charAt
szCharAtMessage:			.asciz "String_charAt(s2, 4) = "
chLetter:		.skip 1

// String_startsWith_1
szStartWith_1:					.asciz "hat."
szStringStartWithTrue_1: .asciz "True"
szStringStartWithFalse_1:	.asciz "False"
szStringStartWithMessage1: .asciz "String_startsWith_1(s1,11,\"hat.\") = "

// String_startsWith_2
szStartWith_2:					.asciz "Cat"
szStringStartWithTrue_2: .asciz "True"
szStringStartWithFalse_2:	.asciz "False"
szStringStartWithMessage2: .asciz "String_startsWith_1(s1,\"Cat.\") = "

// String_endsWith
szEndsWith:						.asciz "in the hat."
szEndsWithTrue:				.asciz "True"
szEndsWithFalse:				.asciz "False"
szStringEndsWithMessage:  .asciz "String_endsWith(s1,\"in the hat.\") = "

chLF:				.byte 0x0a								// Holds new line character

szHelper:			.asciz "Something"
	.text
_start:
	/*===== Prompting user for strings =====*/
	// First string
	LDR	X0,= szPrompt1			// Load the address of szPrompt into X0
	BL		putstring				// Branch and link to putstring, outputs first prompt

	LDR	X0,= sz1					// Load the address of sz1 into X0
	MOV	X1, MAX_LEN				// Move 20 into X1

	BL		getstring				// Branch and link to getstring, to get input

	// Second string
	LDR	X0,= szPrompt2			// Load the address of szPrompt into X0
	BL		putstring				// Branch and link to putstring, outputs first prompt

	LDR	X0,= sz2					// Load the address of sz1 into X0
	MOV	X1, MAX_LEN				// Move 20 into X1

	BL		getstring				// Branch and link to getstring, to get input

	// Third string
	LDR	X0,= szPrompt3			// Load the address of szPrompt into X0
	BL		putstring				// Branch and link to putstring, outputs first prompt

	LDR	X0,= sz3					// Load the address of sz1 into X0
	MOV	X1, MAX_LEN				// Move 20 into X1

	BL		getstring				// Branch and link to getstring, to get input

	/*===== String_length =====*/
	// First string length
	LDR	X0,= szStringLength1	// Load the address of stringLength into X0
	bl		putstring				// Branch and link to putstring to output message

	LDR	X0,= sz1					// Load addres of message into X0
	bl		String_length			// Branch and link to String_length

	LDR	X1,= szLength			// Load the address of szLength into X1
	bl		int64asc					// branch and link to int64asc to convert into ascii value

	LDR	X0,= szLength			// Load the address of szLength into X0
	bl		putstring				// Branch and link to putstring

	LDR	X0,= chLF				// Load the address of chLF into X0
	bl		putch						// Branch and link to putch

	// Second string length
	LDR	X0,= szStringLength2	// Load the address of stringLength into X0
	bl		putstring				// Branch and link to putstring to output message

	LDR	X0,= sz2					// Load addres of message into X0
	bl		String_length			// Branch and link to String_length

	LDR	X1,= szLength			// Load the address of szLength into X1
	bl		int64asc					// branch and link to int64asc to convert into ascii value

	LDR	X0,= szLength			// Load the address of szLength into X0
	bl		putstring				// Branch and link to putstring

	LDR	X0,= chLF				// Load the address of chLF into X0
	bl		putch						// Branch and link to putch

	// Third string length
	LDR	X0,= szStringLength3	// Load the address of stringLength into X0
	bl		putstring				// Branch and link to putstring to output message

	LDR	X0,= sz3					// Load addres of message into X0
	bl		String_length			// Branch and link to String_length

	LDR	X1,= szLength			// Load the address of szLength into X1
	bl		int64asc					// branch and link to int64asc to convert into ascii value

	LDR	X0,= szLength			// Load the address of szLength into X0
	bl		putstring				// Branch and link to putstring

	LDR	X0,= chLF				// Load the address of chLF into X0
	bl		putch						// Branch and link to putch

	/*===== String_equals ===== */
	// Compare string 1 and 3
	LDR	X0,= sz1					// Load the address of sz1 into X0
	LDR	X1,= sz3					// Load the address of sz3 into X1

	bl		String_equals			// Branch and link to String_equals

	CMP	X0, #1					// Compare X0 to 1
	BEQ	same1						// Branch to same1 if X0 is 1

	LDR	X0,= szStringEqual1	// Load the address of szStringEqual1 to X0
	bl		putstring				// Branch and link to putstring

	LDR	X0,= szStringNotEqual // Load the address of szStringNotEqual
	bl		putstring				// Branch and link to putstring

	LDR	X0,= chLF				// Load the address of chLF to X0
	bl		putch						// Branch and link to putch

	B		stringEqual2			// Branch to stringEqual2

same1:
	LDR	X0,= szStringEqual1	// Load the address of szStringEqual1 into X0
	bl		putstring				// Branch and link to putstring

	LDR	X0,= szStringEqual	// Load the address of szStringEqual into X0
	bl		putstring				// Branch and link to putstring

	LDR	X0,= chLF				// Load the address of chLF into X0
	bl		putch						// Branch and link to putch

	B		stringEqual2			// Branch to stringEqual2

stringEqual2:
	// Compare string 1 and 1
	LDR	X0,= sz1					// Load the address of sz1 into X0
	LDR	X1,= sz1					// Load the address of sz2 into X1

	bl		String_equals			// Branch and link to String_equals

	CMP	X0, #1					// Compare X0 to 1
	BEQ	same2						// If X0 equals 1 than branch to same2

	LDR	X0,= szStringEqual2	// Load the address of szStringEqual2
	bl		putstring				// Branch and link to putstring

	LDR	X0,= szStringNotEqual // Load the address of szStringNotEqual into X0
	bl		putstring				// Branch and link to putstring

	LDR	X0,= chLF				// Load the address of chLF into X0
	bl		putch						// Branch and link to putch

	B		ignoreCase				// Branch ignoreCase
same2:
	LDR	X0,= szStringEqual2	// Load the address of szStringEqual2 into X0
	bl		putstring				// Branch and link to putstring

	LDR	X0,= szStringEqual	// Load the address of szStringEqual into X0
	bl		putstring				// Branch and link to putstring

	LDR	X0,= chLF				// Load the address of chLF into X0
	bl		putch						// Branch and link to putch

	B		ignoreCase				// Branch to ignoreCase

ignoreCase:
/*===== String_equalsIgnoreCase =====*/
	// String_equalsIgnoreCase 1
	LDR	X0,= sz1					// Load the address of sz1 into X0
	LDR	X1,= sz3					// Load the address of sz3 into X1

	bl		String_equalsIgnoreCase // Branch and link to String_equalsIgnoreCase

	CMP	X0, #1					// Compare X0 to 1
	BEQ	sameCase2				// If X0 equals 1 branch to sameCase2

	LDR	X0,= szStringEqual1	// Load the address of szStringEqual2 into X0
	bl		putstring				// Branch and link to putstring

	LDR	X0,= szStringNotEqual // Load the address of szStringNotEqual into X0
	bl		putstring				// Branch and link to putstring

	LDR	X0,= chLF				// Load the address of chLF into X0
	bl		putch						// Branch and link to putch

	B		ignoreCase2				// Branch to ignoreCase2
sameCase2:
	LDR	X0,= szStringEqual1	// Load the address of szStringEqual1 into X0
	bl		putstring				// Branch and link to putstring

	LDR	X0,= szStringEqual	// Load the address of szStringEqual into X0
	bl		putstring				// Branch and link to putstring

	LDR	X0,= chLF				// Load the address of chLF into X0
	bl		putch						// Branch and link to putch

	B		ignoreCase2				// Branch to ignoreCase2

ignoreCase2:
	// String_equalsIgnoreCase 2
	LDR	X0,= sz1					// Load the address of sz1 into X0
	LDR	X1,= sz2					// Load the address of sz2 into X1

	bl		String_equalsIgnoreCase // Branch and link to String_equalsIgnoreCase

	CMP	X0, #1					// Compare X0 to 1
	BEQ	sameCase3				// If X0 equals 1 branch to sameCase3

	LDR	X0,= szStringEqual4	// Load the address og szStringEqual3 into X0
	bl		putstring				// Branch and link to putstring

	LDR	X0,= szStringNotEqual // Load the address of szStringNotEqual into X0
	bl		putstring				// Branch and link to putstring

	LDR	X0,= chLF				// Load the address of chLF into X0
	bl		putch						// Branch and link to putch

	B		stringCopy				// Branch to stringCopy label
sameCase3:
	LDR	X0,= szStringEqual4	// Load the address og szStringEqual3
	bl		putstring				// Branch and link to putstring

	LDR	X0,= szStringEqual	// Load the address of szStringEqual into X0
	bl		putstring				// Branch and link to putstring

	LDR	X0,= chLF				// Load the address of chLF into X0
	bl		putch						// Branch and link to putch

	B		stringCopy				// Branch to stringCopy label

stringCopy:
	/*===== String_copy =====*/
	LDR	X0,= szStringCopyMessage1 // Load the address of szStringCopyMessage1 into X0
	BL		putstring				// Branch and link to putstring

	LDR	X0,= chLF				// Load the address of chLF into X0
	bl		putch						// Branch and link to putch

	LDR	X0,= szStringCopyMessage2 // Load the address of szStringCopyMessage2 into X0
	BL		putstring				// Branch and link to putstring

	LDR	X0,= sz1					// Load the address of sz1 into putstring
	BL		putstring

	LDR	X0,= chLF				// Load the address of chLF into X0
	bl		putch						// Branch and link to putch

	LDR	X0,= szStringCopyMessage3 // Load the address of szStringCopyMessage3 into X0
	BL		putstring				// Branch and link to putstring

	LDR	X0,= sz1					// Load the address of sz1 into X0
	BL		String_length			// Branch and link to String_length

	bl		malloc					// Branch and link to malloc

	LDR	X1,= ptrString			// Load the address of ptrString into X1
	STR	X0,[X1]					// Store X0 into ptrString

	LDR	X0,= sz1					// Load the address of sz1 into X0

	LDR	X1,= ptrString			// Load the address of ptrString into X1
	LDR	X1,[X1]					// Access whats in ptrString and load into X1

	BL		String_copy				// Branch and link to String_copy

	LDR	X0,= ptrString			// Load the address of ptrString into X0
	LDR	X0,[X0]					// Load whats in ptrString into X0
	bl		putstring				// Branch and link to putstring

	LDR	X0,= chLF				// Load the address of chLF into X0
	bl		putch						// Branch and link to putch

	LDR	X0,= ptrString			// Load the address of ptrString into X0
	LDR	X0,[X0]					// Load whats in ptrString into X0
	bl		free						// Branch and link to free

	/*===== String_substring_1 =====*/
	LDR	X0,= szStringSubstringMessage1 // Load the address of szStringSubstringMessage1 into X0
	BL		putstring				// Branch and link to putstring

	MOV	X0, #11					// Move 11 into X0
	BL		malloc					// Branch and link to malloc

	LDR	X1,= ptrString1		// Load the address of ptrString1 into X1
	STR	X0,[X1]					// Store whats into X0 into X1

	LDR	X0,= sz3					// Load the address of sz3 into X0

	MOV	X1, #4					// Move 4 into X1 (Start index)

	MOV	X2, #14					// Move 14 into X2 (End index)

	LDR	X3,= ptrString1		// Load the address of ptrString1 into X3
	LDR	X3,[X3]					// Load whats in ptrString into X3

	BL		String_substring_1	// Branch and link to String_substring_1

	LDR	X0,= ptrString1		// Load the address of ptrString1 into X0
	LDR	X0,[X0]					// Load whats at ptrString1 into X0
	bl		putstring				// Branch and link to putstring

	LDR	X0,= chLF				// Load the address of chLF into X0
	bl		putch						// Branch and link to putch

	LDR	X0,= ptrString1		// Load the address of ptrString into X0
	LDR	X0,[X0]					// Load whats in ptrString1 into X0
	bl		free						// Branch and link to free

	/*===== String_substring_2 =====*/
	LDR	X0,= szStringSubstringMessage2 // Load the address of szStringSubstringMessage1 into X0
	BL		putstring				// Branch and link to putstring

	MOV	X0, #9					// Move a literal 9 into X0
	BL		malloc					// Branch and link to malloc

	LDR	X1,= ptrString2		// Load the address of ptrString2 into X1
	STR	X0,[X1]					// Store whats into X0 into X1

	LDR	X0,= sz3					// Load the address of sz3 into X0

	MOV	X1, #7					// Move a literal 7 into X1

	LDR	X2,= ptrString2		// Load the address of ptrString2 into X2
	LDR	X2,[X2]					// Load whats in ptrString into X2

	BL		String_substring_2	// Branch and link to String_substring_2

	LDR	X0,= ptrString2		// Load the address of ptrString1 into X0
	LDR	X0,[X0]					// Load whats at ptrString1 into X0
	bl		putstring				// Branch and link to putstring

	LDR	X0,= chLF				// Load the address of chLF into X0
	bl		putch						// Branch and link to putch

	LDR	X0,= ptrString2		// Load the address of ptrString into X0
	LDR	X0,[X0]					// Load whats in ptrString1 into X0
	bl		free						// Branch and link to free

	/*===== String_charAt =====*/
	LDR	X0,= szCharAtMessage
	bl		putstring

	LDR	X0,= sz2

	MOV	X1, #4

	BL	String_charAt

	LDR	X1,=chLetter
	STR	W0,[X1]

	LDR	X0,=chLetter
	bl		putch

	LDR	X0,= chLF
	bl		putch

	/*===== String_startsWith_1 =====*/
	LDR	X0,= szStringStartWithMessage1 // Load the address of szStringStartWithMessage1 into X0
	BL		putstring				// BL putstring

	LDR	X0,= sz1					// Load the address of sz1 into X0
	MOV	X1, #11					// Move a literal 11 into X1
	LDR	X2,= szStartWith_1	// Load the address of szStartWith_1 into X2

	BL	String_startsWith_1		// Branch and link to String_startsWith_1

	CMP	X0, #0					// Compare X0 to 0
	BEQ	false_startWith_1		// If X0 == 0, than compare was false

	ldr	X0,= szStringStartWithTrue_1 // Load the address of szStringStartWithTrue_1 into X0
	bl		putstring				// Branch and link to putstring

	LDR	X0,= chLF				// Load the address of chLF into X0
	bl		putch						// Branch and link to putch

	B		string_startsWith		// Branch to string_startsWith
false_startWith_1:
	ldr	X0,= szStringStartWithFalse_1 // Load the address of szStringStartWithFalse_1 into X0
	bl		putstring				// Branch and link to putstring

	LDR	X0,= chLF				// Load the address of chLF into X0
	bl		putch						// Branch and link to putch

string_startsWith:
	/*===== String_startsWith_2 =====*/
	LDR	X0,= szStringStartWithMessage2 // Load the address of szStringStartWithMessage2 into X0
	BL		putstring				// BL putstring

	LDR	X0,= sz1					// Load the address of sz1 into X0
	LDR	X1,= szStartWith_2	// Load the address of szStartWith_2 into X1

	BL		String_startsWith_2  // Branch and link to String_startsWith_2

	CMP	X0, #0					// Compare X0 to 0
	BEQ	false_startWith_2		// If X0 == 0, than compare was false

	ldr	X0,= szStringStartWithTrue_2 // Load the address of szStringStartWithTrue_2 into X0
	bl		putstring				// Branch and link to putstring

	LDR	X0,= chLF				// Load the address of chLF into X0
	bl		putch						// Branch and link to putch

	B		endsWith					// Branch to endsWith
false_startWith_2:
	ldr	X0,= szStringStartWithFalse_2 // Load the address of szStringStartWithFalse_2 into X0
	bl		putstring				// Branch and link to putstring

	LDR	X0,= chLF				// Load the address of chLF into X0
	bl		putch						// Branch and link to putch

endsWith:
	/*===== String_endsWith =====*/
	LDR	X0,= szStringEndsWithMessage // Load the address of szStringEndsWithMessage into X0
	BL		putstring				// BL putstring

	LDR	X0,= sz1
	LDR	X1,= szEndsWith

	BL		String_endsWith

	CMP	X0, #0					// Compare X0 to 0
	BEQ	false_endsWith		   // If X0 == 0, than compare was false

	ldr	X0,= szEndsWithTrue  // Load the address of szStringStartWithTrue_2 into X0
	bl		putstring				// Branch and link to putstring

	LDR	X0,= chLF				// Load the address of chLF into X0
	bl		putch						// Branch and link to putch

	B		end						// Branch to endsWith
false_endsWith:
	ldr	X0,= szEndsWithFalse // Load the address of szStringStartWithFalse_2 into X0
	bl		putstring				// Branch and link to putstring

	LDR	X0,= chLF				// Load the address of chLF into X0
	bl		putch						// Branch and link to putch

end:
	/*===== Exit =====*/
	mov 	X0,#0						// Use 0 return code
	mov	X8,#93					// Service code 93 terminates
	svc	0							// Call linus to terminate

	.end
