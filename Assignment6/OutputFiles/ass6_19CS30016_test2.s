	.file	"output.s"

.STR0:	.string "\n"
.STR1:	.string "TEST FILE 2 running....\n\n"
.STR2:	.string "Program to print factors of a number\n\n"
.STR3:	.string "Enter a Number : "
	.text
	.globl	printFactors
	.type	printFactors, @function
printFactors:
.LFB0:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$36, %rsp
	movl	%edi, -4(%rbp)
# 0:res = t000 
	movl	$1, -12(%rbp)
# 1:res = i argument1 = t000 
	movl	-12(%rbp), %eax
	movl	%eax, -8(%rbp)
# 2:res = t001 argument1 = t000 
	movl	-12(%rbp), %eax
	movl	%eax, -16(%rbp)
# 3:argument1 = i argument2 = n 
.L3:
	movl	-8(%rbp), %eax
	movl	-4(%rbp), %edx
	cmpl	%edx, %eax
	jle .L1
# 4:
	jmp	.LRT0
# 5:
	jmp	.LRT0
# 6:res = i argument1 = i 
.L5:
	movl	-8(%rbp), %eax
	movl	$1, %edx
	addl	%edx, %eax
	movl	%eax, -8(%rbp)
# 7:res = t002 argument1 = i 
	movl	-8(%rbp), %eax
	movl	%eax, -20(%rbp)
# 8:
	jmp .L3
# 9:res = t003 argument1 = n argument2 = i 
.L1:
	movl	-4(%rbp), %eax
	cltd
	idivl	-8(%rbp), %eax
	movl	%edx, -24(%rbp)
# 10:res = t004 
	movl	$0, -28(%rbp)
# 11:argument1 = t003 argument2 = t004 
	movl	-24(%rbp), %eax
	movl	-28(%rbp), %edx
	cmpl	%edx, %eax
	je .L4
# 12:
	jmp .L5
# 13:
	jmp .L6
# 14:res = i 
.L4:
# 15:res = t005 
	pushq %rbp
	movl	-8(%rbp) , %edi
	call	printInt
	movl	%eax, -32(%rbp)
	addq $0 , %rsp
# 16:
	movq	$.STR0,	%rdi
# 17:res = t006 
	pushq %rbp
	call	printStr
	movl	%eax, -36(%rbp)
	addq $0 , %rsp
# 18:
	jmp .L5
# 19:
.L6:
	jmp .L5
.LRT0:
	addq	$-36, %rsp
	movq	%rbp, %rsp
	popq	%rbp
	ret
.LFE0:
	.size	printFactors, .-printFactors
	.globl	main
	.type	main, @function
main:
.LFB1:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$48, %rsp
# 20:res = t007 
.L2:
	movl	$1, -16(%rbp)
# 21:res = err argument1 = t007 
	movl	-16(%rbp), %eax
	movl	%eax, -12(%rbp)
# 22:
	movq	$.STR1,	%rdi
# 23:res = t008 
	pushq %rbp
	call	printStr
	movl	%eax, -20(%rbp)
	addq $0 , %rsp
# 24:
	movq	$.STR2,	%rdi
# 25:res = t009 
	pushq %rbp
	call	printStr
	movl	%eax, -24(%rbp)
	addq $0 , %rsp
# 26:
	movq	$.STR3,	%rdi
# 27:res = t010 
	pushq %rbp
	call	printStr
	movl	%eax, -28(%rbp)
	addq $0 , %rsp
# 28:res = t011 argument1 = err 
	leaq	-12(%rbp), %rax
	movq	%rax, -36(%rbp)
# 29:res = t011 
# 30:res = t012 
	pushq %rbp
	movq	-36(%rbp), %rdi
	call	readInt
	movl	%eax, -40(%rbp)
	addq $0 , %rsp
# 31:res = n argument1 = t012 
	movl	-40(%rbp), %eax
	movl	%eax, -4(%rbp)
# 32:res = t013 argument1 = t012 
	movl	-40(%rbp), %eax
	movl	%eax, -44(%rbp)
# 33:res = n 
# 34:
	pushq %rbp
	movl	-4(%rbp) , %edi
	call	printFactors
	addq $0 , %rsp
# 35:res = t014 
	movl	$0, -48(%rbp)
.LRT1:
	addq	$-48, %rsp
	movq	%rbp, %rsp
	popq	%rbp
	ret
.LFE1:
	.size	main, .-main
