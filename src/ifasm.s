.globl main
main:
	pushq %rbp
	movq %rsp, %rbp
	subq $8, %rsp
	movq $1, -8(%rbp)
	cmpq $1, -8(%rbp)
	jmp block_0
	je block_1
block_0:
	movq $2,%rdi
	callq print_int
	addq $8, %rsp
	popq %rbp
	retq
block_1:
	movq $3,%rdi
	callq print_int
	addq $8, %rsp
	popq %rbp
	retq
