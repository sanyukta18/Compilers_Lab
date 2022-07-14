	.file	"output.s"

.STR0:	.string "TEST FILE 4 running....\n\n"
.STR1:	.string "Program to find whether a subset of given array has sum equal to a given target sum\n\n"
.STR2:	.string "Enter number of elements of the array (< 20): "
.STR3:	.string "Enter elements (each element in new line):\n"
.STR4:	.string "Enter target sum: "
.STR5:	.string "YES, there exits a subset with sum equal to given sum\n"
.STR6:	.string "NO, there does not exist any subset with sum equal to given sum\n"
	.text
	.globl	subsetSum
	.type	subsetSum, @function
subsetSum:
.LFB0:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$148, %rsp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movq	%rdx, -16(%rbp)
# 0:res = t000 
	movl	$0, -20(%rbp)
# 1:argument1 = s argument2 = t000 
	movl	-4(%rbp), %eax
	movl	-20(%rbp), %edx
	cmpl	%edx, %eax
	je .L1
# 2:
	jmp .L2
# 3:
	jmp .L2
# 4:res = t001 
.L1:
	movl	$1, -24(%rbp)
# 5:res = t001 
	movl	-24(%rbp), %eax
	jmp	.LRT0
# 6:
	jmp .L2
# 7:res = t002 
.L2:
	movl	$0, -28(%rbp)
# 8:argument1 = n argument2 = t002 
	movl	-8(%rbp), %eax
	movl	-28(%rbp), %edx
	cmpl	%edx, %eax
	je .L3
# 9:
	jmp .L4
# 10:
	jmp .L4
# 11:res = t003 
.L3:
	movl	$0, -32(%rbp)
# 12:res = t003 
	movl	-32(%rbp), %eax
	jmp	.LRT0
# 13:
	jmp .L4
# 14:res = t004 
.L4:
	movl	$0, -36(%rbp)
# 15:res = t005 
	movl	$1, -40(%rbp)
# 16:res = t006 argument1 = n argument2 = t005 
	movl	-8(%rbp), %eax
	movl	-40(%rbp), %edx
	subl	%edx, %eax
	movl	%eax, -44(%rbp)
# 17:res = t008 argument1 = t006 
	movl	-44(%rbp), %eax
	movl	$4, %ecx
	imull	%ecx, %eax
	movl	%eax, -52(%rbp)
# 18:res = t007 argument1 = t004 argument2 = t008 
	movl	-36(%rbp), %eax
	movl	-52(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, -48(%rbp)
# 19:res = t009 argument1 = a argument2 = t007 
	movq	-16(%rbp), %rdx
	movslq	-48(%rbp), %rax
	addq	%rax, %rdx
	movl	(%rdx), %eax
	movl	%eax, -56(%rbp)
# 20:argument1 = t009 argument2 = s 
	movl	-56(%rbp), %eax
	movl	-4(%rbp), %edx
	cmpl	%edx, %eax
	jg .L5
# 21:
	jmp .L6
# 22:
	jmp .L6
# 23:res = t010 
.L5:
	movl	$0, -60(%rbp)
# 24:res = t011 
	movl	$1, -64(%rbp)
# 25:res = t012 argument1 = n argument2 = t011 
	movl	-8(%rbp), %eax
	movl	-64(%rbp), %edx
	subl	%edx, %eax
	movl	%eax, -68(%rbp)
# 26:res = a 
# 27:res = t012 
# 28:res = s 
# 29:res = t013 
	pushq %rbp
	movl	-4(%rbp) , %edi
	movl	-68(%rbp) , %esi
	movq	-16(%rbp), %rdx
	call	subsetSum
	movl	%eax, -72(%rbp)
	addq $0 , %rsp
# 30:res = t013 
	movl	-72(%rbp), %eax
	jmp	.LRT0
# 31:
	jmp .L6
# 32:res = t014 
.L6:
	movl	$0, -76(%rbp)
# 33:res = t015 
	movl	$1, -80(%rbp)
# 34:res = t016 argument1 = n argument2 = t015 
	movl	-8(%rbp), %eax
	movl	-80(%rbp), %edx
	subl	%edx, %eax
	movl	%eax, -84(%rbp)
# 35:res = a 
# 36:res = t016 
# 37:res = s 
# 38:res = t017 
	pushq %rbp
	movl	-4(%rbp) , %edi
	movl	-84(%rbp) , %esi
	movq	-16(%rbp), %rdx
	call	subsetSum
	movl	%eax, -88(%rbp)
	addq $0 , %rsp
# 39:res = t018 
	movl	$0, -92(%rbp)
# 40:argument1 = t017 argument2 = t018 
	movl	-88(%rbp), %eax
	movl	-92(%rbp), %edx
	cmpl	%edx, %eax
	jg .L7
# 41:
	jmp .L8
# 42:res = t019 
.L8:
	movl	$0, -96(%rbp)
# 43:res = t020 
	movl	$1, -100(%rbp)
# 44:res = t021 argument1 = n argument2 = t020 
	movl	-8(%rbp), %eax
	movl	-100(%rbp), %edx
	subl	%edx, %eax
	movl	%eax, -104(%rbp)
# 45:res = t022 
	movl	$0, -108(%rbp)
# 46:res = t023 
	movl	$1, -112(%rbp)
# 47:res = t024 argument1 = n argument2 = t023 
	movl	-8(%rbp), %eax
	movl	-112(%rbp), %edx
	subl	%edx, %eax
	movl	%eax, -116(%rbp)
# 48:res = t026 argument1 = t024 
	movl	-116(%rbp), %eax
	movl	$4, %ecx
	imull	%ecx, %eax
	movl	%eax, -124(%rbp)
# 49:res = t025 argument1 = t022 argument2 = t026 
	movl	-108(%rbp), %eax
	movl	-124(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, -120(%rbp)
# 50:res = t027 argument1 = a argument2 = t025 
	movq	-16(%rbp), %rdx
	movslq	-120(%rbp), %rax
	addq	%rax, %rdx
	movl	(%rdx), %eax
	movl	%eax, -128(%rbp)
# 51:res = t028 argument1 = s argument2 = t027 
	movl	-4(%rbp), %eax
	movl	-128(%rbp), %edx
	subl	%edx, %eax
	movl	%eax, -132(%rbp)
# 52:res = a 
# 53:res = t021 
# 54:res = t028 
# 55:res = t029 
	pushq %rbp
	movl	-132(%rbp) , %edi
	movl	-104(%rbp) , %esi
	movq	-16(%rbp), %rdx
	call	subsetSum
	movl	%eax, -136(%rbp)
	addq $0 , %rsp
# 56:res = t030 
	movl	$0, -140(%rbp)
# 57:argument1 = t029 argument2 = t030 
	movl	-136(%rbp), %eax
	movl	-140(%rbp), %edx
	cmpl	%edx, %eax
	jg .L7
# 58:
	jmp .L9
# 59:
	jmp .L9
# 60:res = t031 
.L7:
	movl	$1, -144(%rbp)
# 61:res = t031 
	movl	-144(%rbp), %eax
	jmp	.LRT0
# 62:
	jmp .L9
# 63:res = t032 
.L9:
	movl	$0, -148(%rbp)
# 64:res = t032 
	movl	-148(%rbp), %eax
	jmp	.LRT0
.LRT0:
	addq	$-148, %rsp
	movq	%rbp, %rsp
	popq	%rbp
	ret
.LFE0:
	.size	subsetSum, .-subsetSum
	.globl	main
	.type	main, @function
main:
.LFB1:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$220, %rsp
# 65:res = t033 
	movl	$20, -84(%rbp)
# 66:res = t034 
	movl	$1, -104(%rbp)
# 67:res = newton argument1 = t034 
	movl	-104(%rbp), %eax
	movl	%eax, -100(%rbp)
# 68:
	movq	$.STR0,	%rdi
# 69:res = t035 
	pushq %rbp
	call	printStr
	movl	%eax, -108(%rbp)
	addq $0 , %rsp
# 70:
	movq	$.STR1,	%rdi
# 71:res = t036 
	pushq %rbp
	call	printStr
	movl	%eax, -112(%rbp)
	addq $0 , %rsp
# 72:
	movq	$.STR2,	%rdi
# 73:res = t037 
	pushq %rbp
	call	printStr
	movl	%eax, -116(%rbp)
	addq $0 , %rsp
# 74:res = t038 argument1 = newton 
	leaq	-100(%rbp), %rax
	movq	%rax, -124(%rbp)
# 75:res = t038 
# 76:res = t039 
	pushq %rbp
	movq	-124(%rbp), %rdi
	call	readInt
	movl	%eax, -128(%rbp)
	addq $0 , %rsp
# 77:res = n argument1 = t039 
	movl	-128(%rbp), %eax
	movl	%eax, -88(%rbp)
# 78:res = t040 argument1 = t039 
	movl	-128(%rbp), %eax
	movl	%eax, -132(%rbp)
# 79:
	movq	$.STR3,	%rdi
# 80:res = t041 
	pushq %rbp
	call	printStr
	movl	%eax, -136(%rbp)
	addq $0 , %rsp
# 81:res = t042 
	movl	$0, -140(%rbp)
# 82:res = i argument1 = t042 
	movl	-140(%rbp), %eax
	movl	%eax, -92(%rbp)
# 83:res = t043 argument1 = t042 
	movl	-140(%rbp), %eax
	movl	%eax, -144(%rbp)
# 84:argument1 = i argument2 = n 
.L12:
	movl	-92(%rbp), %eax
	movl	-88(%rbp), %edx
	cmpl	%edx, %eax
	jl .L10
# 85:
	jmp .L11
# 86:
	jmp .L11
# 87:res = t044 argument1 = i 
.L13:
	movl	-92(%rbp), %eax
	movl	%eax, -148(%rbp)
# 88:res = i argument1 = i 
	movl	-92(%rbp), %eax
	movl	$1, %edx
	addl	%edx, %eax
	movl	%eax, -92(%rbp)
# 89:
	jmp .L12
# 90:res = t045 
.L10:
	movl	$0, -152(%rbp)
# 91:res = t047 argument1 = i 
	movl	-92(%rbp), %eax
	movl	$4, %ecx
	imull	%ecx, %eax
	movl	%eax, -160(%rbp)
# 92:res = t046 argument1 = t045 argument2 = t047 
	movl	-152(%rbp), %eax
	movl	-160(%rbp), %edx
	addl	%edx, %eax
	movl	%eax, -156(%rbp)
# 93:res = t048 argument1 = newton 
	leaq	-100(%rbp), %rax
	movq	%rax, -168(%rbp)
# 94:res = t048 
# 95:res = t049 
	pushq %rbp
	movq	-168(%rbp), %rdi
	call	readInt
	movl	%eax, -172(%rbp)
	addq $0 , %rsp
# 96:res = a argument1 = t046 argument2 = t049 
	leaq	-80(%rbp), %rdx
	movslq	-156(%rbp), %rax
	addq	%rax, %rdx
	movl	-172(%rbp), %eax
	movl	%eax, (%rdx)
# 97:res = t050 argument1 = t049 
	movl	-172(%rbp), %eax
	movl	%eax, -176(%rbp)
# 98:
	jmp .L13
# 99:
.L11:
	movq	$.STR4,	%rdi
# 100:res = t051 
	pushq %rbp
	call	printStr
	movl	%eax, -180(%rbp)
	addq $0 , %rsp
# 101:res = t052 argument1 = newton 
	leaq	-100(%rbp), %rax
	movq	%rax, -188(%rbp)
# 102:res = t052 
# 103:res = t053 
	pushq %rbp
	movq	-188(%rbp), %rdi
	call	readInt
	movl	%eax, -192(%rbp)
	addq $0 , %rsp
# 104:res = s argument1 = t053 
	movl	-192(%rbp), %eax
	movl	%eax, -96(%rbp)
# 105:res = t054 argument1 = t053 
	movl	-192(%rbp), %eax
	movl	%eax, -196(%rbp)
# 106:res = t055 
	movl	$0, -200(%rbp)
# 107:res = a 
# 108:res = n 
# 109:res = s 
# 110:res = t056 
	pushq %rbp
	movl	-96(%rbp) , %edi
	movl	-88(%rbp) , %esi
	leaq	-80(%rbp), %rdx
	call	subsetSum
	movl	%eax, -204(%rbp)
	addq $0 , %rsp
# 111:res = t057 
	movl	$1, -208(%rbp)
# 112:argument1 = t056 argument2 = t057 
	movl	-204(%rbp), %eax
	movl	-208(%rbp), %edx
	cmpl	%edx, %eax
	je .L14
# 113:
	jmp .L15
# 114:
	jmp .L16
# 115:
.L14:
	movq	$.STR5,	%rdi
# 116:res = t058 
	pushq %rbp
	call	printStr
	movl	%eax, -212(%rbp)
	addq $0 , %rsp
# 117:
	jmp .L16
# 118:
.L15:
	movq	$.STR6,	%rdi
# 119:res = t059 
	pushq %rbp
	call	printStr
	movl	%eax, -216(%rbp)
	addq $0 , %rsp
# 120:
	jmp .L16
# 121:res = t060 
.L16:
	movl	$0, -220(%rbp)
# 122:res = t060 
	movl	-220(%rbp), %eax
	jmp	.LRT1
.LRT1:
	addq	$-220, %rsp
	movq	%rbp, %rsp
	popq	%rbp
	ret
.LFE1:
	.size	main, .-main
