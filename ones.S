		;		ARM Programming Assignment #4: Count the ones in a binary number
		;
		;		Write a program that counts the number of ones in a binary number,
		;		stored in a word (4 bytes). Its loop should run no more times than there
		;		are ones in the number. Write the count in `numones`. For the example
		;		number given below, the loop should only run 8 times, counting 8 ones.
		;
		;		Hint:
		;		The first significant instruction in the loop is SUB r1, r1, 1, which
		;		decrements the number, assuming it's stored in register r1. Now,
		;		remember your logical operations.
		;
		;		Bonus:
		;		1. (20 extra points) For the shortest program (by instruction count),
		;		because this operation has to be FAST.
		;		2. (30 extra points) For extending the program to counting the ones
		;		in any word-aligned contiguous region of memory.
		
		;		Your code here
		ADR		r0, example		;get address of example
		LDR		r1, [r0]				;load number into register 1
		MOV		r3, #0				;move zero to track count
		B		compare
numcheck
		SUB		r4, r1, #1			;decrement number
		AND		r1, r1, r4			;AND  to check if result bits are ones
		ADD		r3, r3, #1			;increment count
compare
		CMP		r1, #0				;compare to zero
		BGT		numcheck
		ADR		r0, numones		;get address of counter
		STR		r2, [r0]				;store count
		
		
		
		
example	DCD		0x0010070f
numones	FILL		4
