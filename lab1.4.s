	AREA RESET, DATA, READONLY
	EXPORT __VECTORS
__VECTORS
	DCD 0x20001000
	DCD RESET_HANDLER
N	DCD 20
		
		
	AREA MYCODE, CODE, READONLY
	EXPORT RESET_HANDLER
	ENTRY
RESET_HANDLER
	LDR R0, N
	MOV R2,#0;THANH GHI GIA TANG
	MOV R3,#0;THANH GHI KET QUA
LOOP
	ADD R2,#5
	CMP R2, R0
	BHI DONELOOP
	ADD R3,R2
	B LOOP
DONELOOP
	SUB R2,#5
	SWI &11
	END