	.globl main
main:
	pushq %rbp
	movq %rsp, %rbp
	subq $0, %rsp
	movq $65536, %rdi
	movq $65536, %rsi
	callq initialize
	movq rootstack_begin(%rip), %r15
	movq $0, 0(%r15)
	addq $8, %r15
	jmp start
start:
	movq free_ptr(%rip),%rax
	addq $8, %rax
	movq fromspace_end(%rip),%r13
	cmpq %r13,%rax
	jl block_77
	jmp block_78
block_77:
	movq $0,%r13
	jmp block_80
block_78:
	movq %r15,%rdi
	movq $8,%rsi
	callq collect
	jmp block_80
block_80:
	movq free_ptr(%rip),%r11
	addq $16, free_ptr(%rip)
	movq $3,0(%r11)
	movq %r11,%r14
	movq %r14,%r11
	movq $42,8(%r11)
	movq 8(%r11),%rdi
	callq print_int
	jmp conclusion
conclusion:
	subq $8, %r15
	addq $0, %rsp
	popq %rbp
	retq