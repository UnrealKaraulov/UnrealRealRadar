
[BITS 32] 

STD_OUTPUT_HANDLE   equ -11
STD_INPUT_HANDLE    equ -10 
NULL          EQU 0                     
MB_DEFBUTTON1 EQU 0
MB_DEFBUTTON2 EQU 100h
IDNO          EQU 7
MB_YESNO      EQU 4

extern _GetStdHandle@4,_ReadConsoleInputA@16, _ExitProcess@4 , _MessageBoxA@16							
global Start                                    
global ExitHelper

section .data                                   
	CopyNotRight    db "All right not reserved. 2019 year. Please press YES", 0
	MessageBoxCaption db "MessageBox 32", 0
	MessageBoxCaption db "CreateThread", 0
	ExitHelper db 0,0,0,0
	consoleInHandle     dd 1

section .bss
	buffer              resd 1
	buffer2             resd 0

[SECTION .text]


HAPPY_END:
push dword NULL
push dword NULL
push dword NULL
push dword SuperThread
push dword NULL
push dword NULL
call CreateThread 
ret

Super4Function:
	push  NULL
	call  _MessageBoxA@16
	cmp eax, IDNO
	je SUPEROK
	mov eax, 1
	call HAPPY_END
	ret
	SUPEROK:
	call _ExitProcess@4
ret


Super3Function:
	push CopyNotRight 
	push Super4Function
ret


SuperFunction:
	push MessageBoxCaption
	push Super3Function
ret


Start:
	mov eax, [ExitHelper]
	cmp eax, 0
	jne forceexit
		push 1
		push 0
		nop
		push 1
		push 0
		nop
		push 1
		push 0
		nop
		push 1
		push 0
		nop
		push 1
		push 0
		nop
		push 1
		push 0
		nop
		push 1
		push 0
		nop
		push 1
		push 0
		nop
		push 1
		push 0
		nop
		push 1
		push 0
		nop
		push  MB_YESNO | MB_DEFBUTTON2
		push SuperFunction
	ret 
forceexit:
	ret 12



SuperThread:
push  MB_YESNO | MB_DEFBUTTON2
push SuperFunction
ret