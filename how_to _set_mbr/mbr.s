.code16

.global start

start:
	movw %cs,%ax
	movw %ax,%ds
	movw %ax,%es
	movw %ax,%ss
	movw $0x7d00,%ax
	movw %ax,%sp
	pushw $13
	pushw $message
	callw displayStr

loop:
	jmp loop

message:
	.string "Hello,World!\n\0"

displayStr:
	pushw %bp
	movw 4(%esp),%ax
	movw %ax,%bp
	movw 6(%esp),%cx
	movw $0x1301,%ax
	movw $0x000c,%bx
	movw $0x0000,%dx
	int $0x10
	popw %bp
	ret




