; /usr/local/bin/nasm -f macho <file>.asm && ld -macosx_version_min 10.7.0 -o <file> <file>.o && ./<file>

section .data

msg:	db	"abcdefg", 10
.len:	equ	$ - msg

xmsg:	db	1,1,1,1,1,1,1, 0
.len:	equ	$ - xmsg


section .bss

output:	resb 7

section .text
global _main

_main:
	mov edx, output
	mov eax, msg
	mov ecx, xmsg
	mov ebx, 0

xorachar:
    mov eax, [eax + ebx]
	sub eax, [ecx + ebx]
	mov [edx], eax
	inc ebx
	inc edx
	mov eax, msg
	cmp ebx, 8
	jne xorachar

write:
	push dword 8
	push dword output
	push dword 1
	mov eax, 4
	sub esp, 4
	int 0x80
	add esp, 16

	push dword 0
	mov eax, 1
	sub esp, 12
	int 0x80
