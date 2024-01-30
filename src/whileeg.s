.globl main
main:
	pushq %rbp
	movq %rsp, %rbp
	subq $8, %rsp
	movq $0, -8(%rbp)
whiletest:
	cmpq $5, -8(%rbp)
	jge exit
	jmp loop
loop:
	movq -8(%rbp), %rdi
	callq print_int
	incq -8(%rbp)
	jmp whiletest
exit:
	addq $8, %rsp
	popq %rbp
	retq
