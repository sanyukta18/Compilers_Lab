	.file	"Ass1.c"								#source file name
	.text											#code starts
	.section	.rodata								#read only data section
	.align 8 										#align with 8-byte boundary.
.LC0:												#label of f-string-1st printf 
	.string	"Enter how many elements you want:"      
.LC1:												#label of f-string-scanf  
	.string	"%d"
.LC2:												#label of f-string-2nd printf
	.string	"Enter the %d elements:\n"				
.LC3:												#label of f-string-3rd printf
	.string	"\nEnter the item to search"
.LC4:												#label of f-string-4th printf
	.string	"\n%d found in position: %d\n"
	.align 8
.LC5:												#label of f-string-5th printf
	.string	"\nItem is not present in the list."
	.text											#code starts
	.globl	main									#main is a global name
	.type	main, @function							#main is a function.
main:												#main starts
.LFB0:
	.cfi_startproc				#call frame information
	endbr64
	pushq	%rbp				#save old base pointer
	.cfi_def_cfa_offset 16 		
	.cfi_offset 6, -16          
	movq	%rsp, %rbp			#rbp <-- rsp set new stack base pointer
	.cfi_def_cfa_register 6
	subq	$432, %rsp			#create space for local arrays and variables
	movq	%fs:40, %rax		#Segment addressing
	movq	%rax, -8(%rbp)		#M[rbp-8] <-- rax 
	xorl	%eax, %eax			#clear eax
	leaq	.LC0(%rip), %rdi 	#rdi <--first parameter of printf			
	call	puts@PLT 			#calls puts function
	leaq	-432(%rbp), %rax	#rax <-- (rbp-432) n
	movq	%rax, %rsi 			#rsi <-- rax(n) 
	leaq	.LC1(%rip), %rdi 	#rdi <-- n 
	movl	$0, %eax 			#eax <-- 0
	call	__isoc99_scanf@PLT 	
	movl	-432(%rbp), %eax    #eax <-- M[rbp-432](n)
	movl	%eax, %esi 			#esi <-- n
	leaq	.LC2(%rip), %rdi    #rdi <-- second parameter of printf 
	movl	$0, %eax            #eax <-- 0 
	call	printf@PLT
	movl	$0, -424(%rbp)      #i = 0, -424(%rbp) = i 
	jmp	.L2
.L3:
	leaq	-416(%rbp), %rax    #rax <-- rbp-416 (&a)
	movl	-424(%rbp), %edx    #edx <-- i 
	movslq	%edx, %rdx   	    #rdx <-- edx (i)
	salq	$2, %rdx  		    #rdx <-- shift aritmetic 2-bit left. (4*i)
	addq	%rdx, %rax 		    #rax <-- a+4*i
	movq	%rax, %rsi 		    #rsi <-- a[i]
 	leaq	.LC1(%rip), %rdi    #rdi
	movl	$0, %eax            #eax <-- 0 
	call	__isoc99_scanf@PLT  #taking in value of a[i]
	addl	$1, -424(%rbp)      #i = i+1
.L2:
	movl	-432(%rbp), %eax    #eax <-- M[rbp-432] (n)
	cmpl	%eax, -424(%rbp)    #compares M[rbp-432] (n) and M[rbp-424] (i)
	jl	.L3 				    # if i < n go to .L3
	movl	-432(%rbp), %edx    #edx <-- n 
	leaq	-416(%rbp), %rax    #rax <-- rbp-416 (&a)
	movl	%edx, %esi 		    #esi <-- n ,second parameter 
	movq	%rax, %rdi          #rdi <-- a ,first parameter 
	call	inst_sort           #calling inst_sort 
	leaq	.LC3(%rip), %rdi    #printing .LC3(printing asking for item)
	call	puts@PLT
	leaq	-428(%rbp), %rax    #rax <-- rbp-428
	movq	%rax, %rsi          #rsi <-- rax 
	leaq	.LC1(%rip), %rdi    #taking in %d in rdi 
	movl	$0, %eax            #eax <-- 0 
	call	__isoc99_scanf@PLT  # scanning item to search 
	movl	-428(%rbp), %edx    #edx <--M[rbp-428] (item)
	movl	-432(%rbp), %ecx    #ecx <--M[rbp-432] (n)
	leaq	-416(%rbp), %rax    #rax <-- rbp-416  (a)
	movl	%ecx, %esi          #second parameter n
	movq	%rax, %rdi          #first parameter a 
	call	bsearch        	    #calling bsearch 
	movl	%eax, -420(%rbp) 	#M[rbp-420] <-- loc
	movl	-420(%rbp), %eax 	#eax <-- loc
	cltq      							#rax <-- eax
	movl	-416(%rbp,%rax,4), %edx 	#edx <-- a+4*loc (a[loc])
	movl	-428(%rbp), %eax    		#eax <-- item
	cmpl	%eax, %edx     		#compares item and a[loc]
	jne	.L4                		#if item != a[loc] go to .L4
	movl	-420(%rbp), %eax  	#eax <-- M[rbp-420] loc
	leal	1(%rax), %edx       #edx <-- (%rax+1) (loc+1)
	movl	-428(%rbp), %eax 	#eax <-- item
	movl	%eax, %esi          #esi <-- item 
	leaq	.LC4(%rip), %rdi  	#prints .LC4 label (found in position %d i.e loc+1)
	movl	$0, %eax 		    #eax <-- 0
	call	printf@PLT  
	jmp	.L5   					#go to label .L5
.L4:
	leaq	.LC5(%rip), %rdi  	#prints Item is not present in the list
	call	puts@PLT
.L5:
	movl	$0, %eax  			#eax <-- 0 
	movq	-8(%rbp), %rcx      #rcx <-- M[rbp-8]
	xorq	%fs:40, %rcx 		#compare to canary
	je	.L7              		#if equals go to .L7
	call	__stack_chk_fail@PLT #else fail
.L7:
	leave  						#clear stack
	.cfi_def_cfa 7, 8
	ret               			#return 
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.globl	inst_sort
	.type	inst_sort, @function
inst_sort:						#inst_sort function 
.LFB1:
	.cfi_startproc
	endbr64
	pushq	%rbp 			#save old base pointer
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp 		#rbp <-- rsp set new stack pointer
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp) #M[rbp-24] <-- num[]
	movl	%esi, -28(%rbp) #M[rbp-28] <-- n
	movl	$1, -8(%rbp)    #j <-- 1
	jmp	.L9 #go to .l9 
.L13:
	movl	-8(%rbp), %eax   # eax<-- (M[rbp-8])(j)
	cltq 					 #rax <-- eax(j)
	leaq	0(,%rax,4), %rdx #rdx <-- j*4
	movq	-24(%rbp), %rax  #rax <-- num[](M[rbp-24])
	addq	%rdx, %rax 		 #rax <-- num(rax)+j*4(rdx)
	movl	(%rax), %eax 	 #eax <-- num[j]
	movl	%eax, -4(%rbp) 	 #M[rbp-4] <-- num[j] / k <-- num[j]
	movl	-8(%rbp), %eax 	 #eax <-- j(M[rbp-8])
	subl	$1, %eax 		 #j = j-1, eax <-- eax-1
	movl	%eax, -12(%rbp)  # M[rbp-12] <-- eax/(j)/ i<--j-1
	jmp	.L10   	 			 #go to .L10
.L12:
	movl	-12(%rbp), %eax   #eax <-- i
	cltq  					  #rax <-- eax 
	leaq	0(,%rax,4), %rdx  # rdx <-- 4*i
	movq	-24(%rbp), %rax   #rax <-- num[]
	addq	%rdx, %rax        #num <-- num+4*i
	movl	-12(%rbp), %edx   #edx <-- i
	movslq	%edx, %rdx        # rdx <-- edx
	addq	$1, %rdx  		  # rdx <-- rdx+1 / i<-- i+1 
	leaq	0(,%rdx,4), %rcx  #rck <-- 4*(i+1)
	movq	-24(%rbp), %rdx   # rdx <-- num
	addq	%rcx, %rdx        #rdx <-- num+4*(i+1)
	movl	(%rax), %eax 	  #eax <-- num[i]
	movl	%eax, (%rdx)      # num[i+1] = num[i]
	subl	$1, -12(%rbp) 	  # i<-- i-1
.L10:
	cmpl	$0, -12(%rbp)    #compares 0 and i
	js	.L11 			     #if i>0 go to .L11
	movl	-12(%rbp), %eax  #eax <-- M[rbp-12] (i)
	cltq 					 #rax <-- eax (i)
	leaq	0(,%rax,4), %rdx #rdx <-- 4*i 
	movq	-24(%rbp), %rax  #rax <-- M[rbp-24] (num)
	addq	%rdx, %rax 		 #rax <-- rax+rdx (num+4*i)
	movl	(%rax), %eax     #eax <-- num[i]
	cmpl	%eax, -4(%rbp)   #compares num[i] and k
	jl	.L12   				 #if k < num[i] (enter second loop)  
.L11:
	movl	-12(%rbp), %eax  #eax <-- i
	cltq 					 #rax <-- eax
	addq	$1, %rax  		 #rax <-- rax+1/ i = i+1
	leaq	0(,%rax,4), %rdx #rdx<--4*(i)
	movq	-24(%rbp), %rax  #rax <-- num[]
	addq	%rax, %rdx 		 #rdx <-- num+4*(i)
	movl	-4(%rbp), %eax   #eax <-- M[rbp-4]/ k 
	movl	%eax, (%rdx)     #num[i+1] <-- k
	addl	$1, -8(%rbp)     #j <-- j+1
.L9:
	movl	-8(%rbp), %eax   #eax <-- j(M[rbp-8])
	cmpl	-28(%rbp), %eax  #compares j and n
	jl	.L13 				 #if j<n go to .L13(continue upper loop)
	nop
	nop
	popq	%rbp             #pop stack pointer
	.cfi_def_cfa 7, 8
	ret 					#return
	.cfi_endproc
.LFE1:
	.size	inst_sort, .-inst_sort
	.globl	bsearch
	.type	bsearch, @function
bsearch:                      #bsearch function
.LFB2:
	.cfi_startproc
	endbr64
	pushq	%rbp  			  #save old base pointer
	.cfi_def_cfa_offset 16  
	.cfi_offset 6, -16
	movq	%rsp, %rbp  	  #rbp <-- rsp set new stack base pointer
	.cfi_def_cfa_register 6 
	movq	%rdi, -24(%rbp)   #M[rbp-24] <-- a[] 
	movl	%esi, -28(%rbp)   #M[rbp-28] <-- n
	movl	%edx, -32(%rbp)   #M[rbp-32] <-- item
	movl	$1, -8(%rbp)  	  #bottom <-- 1
	movl	-28(%rbp), %eax   #top<--n,%eax has content of -28(%rbp)
	movl	%eax, -12(%rbp)   #M[rbp-12] <--eax (top)
.L18:
	movl	-8(%rbp), %edx    #edx <-- M[rbp-8],edx <--bottom
	movl	-12(%rbp), %eax   #eax <-- M[rbp-12],eax <-- top 
	addl	%edx, %eax 		  #top+bottom and store in eax
	movl	%eax, %edx 		  #edx stores eax (top+bottom)
	shrl	$31, %edx  		  #shifts edx by 31 bits(reads sign bit of edx)
	addl	%edx, %eax  	  #edx+eax (adds 1 to eax if edx is -ve)
	sarl	%eax 			  # /2 so eax(mid) <-- (top+bottom)/2
	movl	%eax, -4(%rbp)    #both %eax and -4(%rbp) contain
	movl	-4(%rbp), %eax    #mid
	cltq  					  #rax <-- eax (mid)
	leaq	0(,%rax,4), %rdx  #rdx <-- 4*mid
	movq	-24(%rbp), %rax   #rax <-- a
	addq	%rdx, %rax  	  #rax <-- a+4*mid
	movl	(%rax), %eax 	  #eax <-- a[mid]
	cmpl	%eax, -32(%rbp)   #comp a[mid] and item,(-32(%rbp)) 
	jge	.L15				  #if item >= a[mid] go to .L15
	movl	-4(%rbp), %eax    #eax <-- (-4(%rbp)) or mid
	subl	$1, %eax  		  #eax <-- eax-1 (mid-1)
	movl	%eax, -12(%rbp)   #M[rbp-12] <-- eax, top <-- mid-1
	jmp	.L16 				  #goto .L16
.L15:
	movl	-4(%rbp), %eax    #eax <-- -4(%rbp) copying mid 
	cltq 					  #rax <-- eax(mid)
	leaq	0(,%rax,4), %rdx  #rdx <-- 4*mid 
	movq	-24(%rbp), %rax   #rax <-- a []
	addq	%rdx, %rax  	  #rax < a+4*mid
	movl	(%rax), %eax 	  #eax <-- a[mid]
	cmpl	%eax, -32(%rbp)   #comp a[mid] and item (-32(%rbp))
	jle	.L16				  #if a[mid] <= item go to .L16
	movl	-4(%rbp), %eax    #eax <-- -4(%rbp) copying mid
	addl	$1, %eax 		  #eax <-- eax + 1 (mid=mid+1)
 	movl	%eax, -8(%rbp) 	  #(-8(%rbp))bottom <-- eax+1 (mid+1)
.L16:
	movl	-4(%rbp), %eax 	  #eax <-- -4(%rbp) copying mid
	cltq  					  #rax <-- eax (mid)
	leaq	0(,%rax,4), %rdx  #rdx <-- 4*mid
	movq	-24(%rbp), %rax   #rax <-- a[] 
	addq	%rdx, %rax 		  #rax <-- a+4*mid
	movl	(%rax), %eax 	  #eax <-- a[mid]
	cmpl	%eax, -32(%rbp)   #comp a[mid] and item
	je	.L17 				  # go to .l17 if equal 
	movl	-8(%rbp), %eax    #eax <-- -8(%rbp) copying bottom 
	cmpl	-12(%rbp), %eax   #compares top and bottom
	jle	.L18				  #if top >= bottom go to .L18(back into loop)
.L17:
	movl	-4(%rbp), %eax    #eax <-- -4(rbp) copying mid
	popq	%rbp 		      #pop rbp stack pointer
	.cfi_def_cfa 7, 8
	ret 			    	  #return mid 
	.cfi_endproc
.LFE2:
	.size	bsearch, .-bsearch
	.ident	"GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
