.globl main
main:
	pushq %rbp
	movq %rsp, %rbp
	subq $8, %rsp
	movq $0, -8(%rbp)
whiletest:
	cmpq $4, -8(%rbp)
	jge exit
	jmp iftest
iftest:
	cmpq $3, -8(%rbp)
	jmp block_0
	je block_1
block_0:
	movq $-8(%rbp), %rdi
	callq print_int
	addq $8, %rsp
	popq %rbp
	retq
	incq stk
	jmp whiletest
block_1:
	movq $3,%rdi
	callq print_int
	addq $8, %rsp
	popq %rbp
	retq
	jmp whiletest
exit:
