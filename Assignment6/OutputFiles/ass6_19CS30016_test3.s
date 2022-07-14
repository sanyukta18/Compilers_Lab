	.file	"output.s"

.STR0:	.string "TEST FILE 3 running....\n\n"
.STR1:	.string "Program to find number of trailing zeros in factorial of a number\n\n"
.STR2:	.string "Enter the number: "
.STR3:	.string "\nNumber of trailing zeros in "
.STR4:	.string "! is "
.STR5:	.string "\n"
	.text
	.globl	trialingZeros
	.type	trialingZeros, @function
trialingZeros:
.LFB0:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$44, %rsp
	movl	%edi, -4(%rbp)
# 0:res = t000 
	movl	$0, -12(%rbp)
# 1:res = ans argument1 = t000 
	movl	-12(%rbp), %eax
	movl	%eax, -8(%rbp)
# 2:res = t001 
.L3:
	movl	$0, -16(%rbp)
# 3:argument1 = n argument2 = t001 
	movl	-4(%rbp), %eax
	movl	-16(%rbp), %edx
	cmpl	%edx, %eax
	jg .L1
# 4:
	jmp .L2
# 5:
	jmp .L2
# 6:res = t002 
.L1:
	movl	$5, -20(%rbp)
# 7:res = t003 argument1 = n argument2 = t002 
	movl	-4(%rbp), %eax
	cltd
	idivl	-20(%rbp), %eax
	movl	%eax, -24(%rbp)
# 8:res = t004 argument1 = ans argument2 = t003 
	movl	-8(%rbp), %eax
	movl	-24(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, -28(%rbp)
# 9:res = ans argument1 = t004 
	movl	-28(%rbp), %eax
	movl	%eax, -8(%rbp)
# 10:res = t005 argument1 = t004 
	movl	-28(%rbp), %eax
	movl	%eax, -32(%rbp)
# 11:res = t006 
	movl	$5, -36(%rbp)
# 12:res = t007 argument1 = n argument2 = t006 
	movl	-4(%rbp), %eax
	cltd
	idivl	-36(%rbp), %eax
	movl	%eax, -40(%rbp)
# 13:res = n argument1 = t007 
	movl	-40(%rbp), %eax
	movl	%eax, -4(%rbp)
# 14:res = t008 argument1 = t007 
	movl	-40(%rbp), %eax
	movl	%eax, -44(%rbp)
# 15:
	jmp .L3
# 16:res = ans 
.L2:
	movl	-8(%rbp), %eax
	jmp	.LRT0
.LRT0:
	addq	$-44, %rsp
	movq	%rbp, %rsp
	popq	%rbp
	ret
.LFE0:
	.size	trialingZeros, .-trialingZeros
	.globl	main
	.type	main, @function
main:
.LFB1:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$68, %rsp
# 17:res = t009 
	movl	$1, -12(%rbp)
# 18:res = tikitaka argument1 = t009 
	movl	-12(%rbp), %eax
	movl	%eax, -8(%rbp)
# 19:
	movq	$.STR0,	%rdi
# 20:res = t010 
	pushq %rbp
	call	printStr
	movl	%eax, -16(%rbp)
	addq $0 , %rsp
# 21:
	movq	$.STR1,	%rdi
# 22:res = t011 
	pushq %rbp
	call	printStr
	movl	%eax, -20(%rbp)
	addq $0 , %rsp
# 23:
	movq	$.STR2,	%rdi
# 24:res = t012 
	pushq %rbp
	call	printStr
	movl	%eax, -24(%rbp)
	addq $0 , %rsp
# 25:res = t013 argument1 = tikitaka 
	leaq	-8(%rbp), %rax
	movq	%rax, -32(%rbp)
# 26:res = t013 
# 27:res = t014 
	pushq %rbp
	movq	-32(%rbp), %rdi
	call	readInt
	movl	%eax, -36(%rbp)
	addq $0 , %rsp
# 28:res = n argument1 = t014 
	movl	-36(%rbp), %eax
	movl	%eax, -4(%rbp)
# 29:res = t015 argument1 = t014 
	movl	-36(%rbp), %eax
	movl	%eax, -40(%rbp)
# 30:
	movq	$.STR3,	%rdi
# 31:res = t016 
	pushq %rbp
	call	printStr
	movl	%eax, -44(%rbp)
	addq $0 , %rsp
# 32:res = n 
# 33:res = t017 
	pushq %rbp
	movl	-4(%rbp) , %edi
	call	printInt
	movl	%eax, -48(%rbp)
	addq $0 , %rsp
# 34:
	movq	$.STR4,	%rdi
# 35:res = t018 
	pushq %rbp
	call	printStr
	movl	%eax, -52(%rbp)
	addq $0 , %rsp
# 36:res = n 
# 37:res = t019 
	pushq %rbp
	movl	-4(%rbp) , %edi
	call	trialingZeros
	movl	%eax, -56(%rbp)
	addq $0 , %rsp
# 38:res = t019 
# 39:res = t020 
	pushq %rbp
	movl	-56(%rbp) , %edi
	call	printInt
	movl	%eax, -60(%rbp)
	addq $0 , %rsp
# 40:
	movq	$.STR5,	%rdi
# 41:res = t021 
	pushq %rbp
	call	printStr
	movl	%eax, -64(%rbp)
	addq $0 , %rsp
# 42:res = t022 
	movl	$0, -68(%rbp)
# 43:res = t022 
	movl	-68(%rbp), %eax
	jmp	.LRT1
.LRT1:
	addq	$-68, %rsp
	movq	%rbp, %rsp
	popq	%rbp
	ret
.LFE1:
	.size	main, .-main
