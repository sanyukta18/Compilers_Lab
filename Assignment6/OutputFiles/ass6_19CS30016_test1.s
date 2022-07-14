	.file	"output.s"

.STR0:	.string "TEST FILE 1 running....\n\n"
.STR1:	.string "Program to compute factorial of a number\n\n"
.STR2:	.string "Enter the number (< 15) : "
.STR3:	.string "\nFactorial of number is: "
.STR4:	.string "\n"
	.text
	.globl	factorial
	.type	factorial, @function
factorial:
.LFB0:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$36, %rsp
	movl	%edi, -4(%rbp)
# 0:res = t000 
	movl	$1, -16(%rbp)
# 1:res = f argument1 = t000 
	movl	-16(%rbp), %eax
	movl	%eax, -12(%rbp)
# 2:res = t001 
	movl	$1, -20(%rbp)
# 3:res = i argument1 = t001 
	movl	-20(%rbp), %eax
	movl	%eax, -8(%rbp)
# 4:res = t002 argument1 = t001 
	movl	-20(%rbp), %eax
	movl	%eax, -24(%rbp)
# 5:argument1 = i argument2 = n 
.L3:
	movl	-8(%rbp), %eax
	movl	-4(%rbp), %edx
	cmpl	%edx, %eax
	jle .L1
# 6:
	jmp .L2
# 7:
	jmp .L2
# 8:res = t003 argument1 = i 
.L4:
	movl	-8(%rbp), %eax
	movl	%eax, -28(%rbp)
# 9:res = i argument1 = i 
	movl	-8(%rbp), %eax
	movl	$1, %edx
	addl	%edx, %eax
	movl	%eax, -8(%rbp)
# 10:
	jmp .L3
# 11:res = t004 argument1 = f argument2 = i 
.L1:
	movl	-12(%rbp), %eax
	imull	-8(%rbp), %eax
	movl	%eax, -32(%rbp)
# 12:res = f argument1 = t004 
	movl	-32(%rbp), %eax
	movl	%eax, -12(%rbp)
# 13:res = t005 argument1 = t004 
	movl	-32(%rbp), %eax
	movl	%eax, -36(%rbp)
# 14:
	jmp .L4
# 15:res = f 
.L2:
	movl	-12(%rbp), %eax
	jmp	.LRT0
.LRT0:
	addq	$-36, %rsp
	movq	%rbp, %rsp
	popq	%rbp
	ret
.LFE0:
	.size	factorial, .-factorial
	.globl	main
	.type	main, @function
main:
.LFB1:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$60, %rsp
# 16:res = t006 
	movl	$1, -12(%rbp)
# 17:res = err argument1 = t006 
	movl	-12(%rbp), %eax
	movl	%eax, -8(%rbp)
# 18:
	movq	$.STR0,	%rdi
# 19:res = t007 
	pushq %rbp
	call	printStr
	movl	%eax, -16(%rbp)
	addq $0 , %rsp
# 20:
	movq	$.STR1,	%rdi
# 21:res = t008 
	pushq %rbp
	call	printStr
	movl	%eax, -20(%rbp)
	addq $0 , %rsp
# 22:
	movq	$.STR2,	%rdi
# 23:res = t009 
	pushq %rbp
	call	printStr
	movl	%eax, -24(%rbp)
	addq $0 , %rsp
# 24:res = t010 argument1 = err 
	leaq	-8(%rbp), %rax
	movq	%rax, -32(%rbp)
# 25:res = t010 
# 26:res = t011 
	pushq %rbp
	movq	-32(%rbp), %rdi
	call	readInt
	movl	%eax, -36(%rbp)
	addq $0 , %rsp
# 27:res = n argument1 = t011 
	movl	-36(%rbp), %eax
	movl	%eax, -4(%rbp)
# 28:res = t012 argument1 = t011 
	movl	-36(%rbp), %eax
	movl	%eax, -40(%rbp)
# 29:
	movq	$.STR3,	%rdi
# 30:res = t013 
	pushq %rbp
	call	printStr
	movl	%eax, -44(%rbp)
	addq $0 , %rsp
# 31:res = n 
# 32:res = t014 
	pushq %rbp
	movl	-4(%rbp) , %edi
	call	factorial
	movl	%eax, -48(%rbp)
	addq $0 , %rsp
# 33:res = t014 
# 34:res = t015 
	pushq %rbp
	movl	-48(%rbp) , %edi
	call	printInt
	movl	%eax, -52(%rbp)
	addq $0 , %rsp
# 35:
	movq	$.STR4,	%rdi
# 36:res = t016 
	pushq %rbp
	call	printStr
	movl	%eax, -56(%rbp)
	addq $0 , %rsp
# 37:res = t017 
	movl	$0, -60(%rbp)
# 38:res = t017 
	movl	-60(%rbp), %eax
	jmp	.LRT1
.LRT1:
	addq	$-60, %rsp
	movq	%rbp, %rsp
	popq	%rbp
	ret
.LFE1:
	.size	main, .-main
