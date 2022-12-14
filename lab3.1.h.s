	AREA RESET, DATA,READONLY
	EXPORT __VECTORS
__VECTORS
	DCD 0x20001000
	DCD RESET_HANDLER
M	DCD 12
N	DCD 9
		
	AREA UCLN_AREA , CODE, READONLY
UCLN PROC
	PUSH {LR}
	MOV R2,R0
	MOV R3,R1
UCLNLOOP
	CMP R2,R3
	BEQ ENDUCLNLOOP
	SUBLT R3,R2
	SUBGT R2,R3
	B UCLNLOOP
ENDUCLNLOOP
	MOV R4,R3; KET QUA
	POP {LR}
	BX LR
	ENDP
	
	AREA BCNN_AREA, CODE, READONLY
BCNN PROC
	PUSH {LR}
	BL UCLN
	MUL R5, R0,R1
	MOV R6,#0; THANH GHI KET QUA
BCNNLOOP
	CMP R5,#0
	BEQ ENDBCNNLOOP
	SUB R5,R4
	ADD R6,#1
	B BCNNLOOP
ENDBCNNLOOP
	POP {LR}
	BX LR
	ENDP
	
	AREA MAIN, CODE, READONLY
	EXPORT RESET_HANDLER
RESET_HANDLER
	LDR R0, M
	LDR R1, N
	BL BCNN
	SWI &11
	END