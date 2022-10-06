	AREA RESET, DATA, READONLY
	EXPORT __VECTORS
__VECTORS
	DCD 0x20001000
	DCD RESET_HANDLER
N	DCD 3
X	DCD 2
	
	AREA MYCODE, CODE, READONLY
	EXPORT RESET_HANDLER
	ENTRY
RESET_HANDLER
	LDR R0,N
	LDR R1,X
	MOV R2,#1
	MOV R3,#1
LOOP
	CMP R0,#0
	BEQ DONE
	MUL R2,R1
	ADD R3,R2
	SUB R0,#1
	B LOOP
DONE
	SWI &11
	END