
#include "my1.h"
/*******************************************************

code of printStr

********************************************************/

int printStr(char *s)
{
	int i = 0; int c = 1; int bytes;
	int len = 0;
	while(s[i] != '\0')
	{
		i++;
		c++;
		if(s[i] != '\040')
			len++;
	}
	char a[c+1];
	i = 0;
	while(i<c+1)
	{
		a[i] = s[i];
		i++;
	}
	a[c] = '\n';
	//int len = c;
	
	bytes = c+1;
	
	__asm__ __volatile__(

		"movl $1, %%eax \n\t"
		"movq $1, %%rdi \n\t"
		"syscall \n\t"
		:
		:"S"(a), "d"(bytes)
	);


	return len;
}

/****************************************************************************

code of readInt - returns 0 if error and length of characters printed if pass

****************************************************************************/

int readInt(int *n)
{
	
	int bytes = 10;

	char x[bytes+5];
	
	__asm__ __volatile__(

		"movl $0, %%eax \n\t"     // syscall number
		"movq $0, %%rdi \n\t"     // stdout/stdin
		"syscall \n\t"
		:
		:"S"(x), "d"(bytes+5)
	);
	
	//printf("x: %s\n",x);
    int i = 0; int len; int s,res;
    res = 0;
    char y[20]; int j = 0;
	while(x[i] != '\n')
	{
	
		if((x[i]=='-')||(x[i]=='0')||(x[i]=='1')||(x[i]=='2')||(x[i]=='3')||(x[i]=='4')||(x[i]=='5')||(x[i]=='6')||(x[i]=='7')||(x[i]=='8')||(x[i]=='9'))
		{
			y[j]=x[i];
			j++;
		}
		else
			return 0;
		i++;
	}
	y[j] = '\0';
	len = j;
	//printf("%d\n",len);
	//printf("%s\n",n); 
	i = 0; s=1; res = 0; 
	if(x[0]=='-')
	{
		s=-1;
		i=1;
	}
	while(y[i] != '\0')
	{
		if(y[i]=='-')
			return 0;

		switch(y[i]) 
		{
	      	case '0' :
		         res = res*10+0;
		         i++;
		         continue;
	      	case '1' :
	      		 res = res*10+1;
		         i++;
		         continue;
	      	case '2' :
	        	 res = res*10+2;
		         i++;
		         continue;
	      	case '3' :
	         	 res = res*10+3;
		         i++;
		         continue;
	      	case '4' :
	        	 res = res*10+4;
		         i++;
		         continue;
	       	case '5' :
	       		 res = res*10+5;
		         i++;
		         continue;
	       	case '6' :
	       		 res = res*10+6;
		         i++;
		         continue;
	       	case '7' :
	       		 res = res*10+7;
		         i++;
		         continue;
	       	case '8' :
	       		 res = res*10+8;
		         i++;
		         continue;
	       	case '9' :
	       		 res = res*10+9;
		         i++;
		         continue;
   		}
	}
	res = s*res;
	*n = res;
	return len;
} 

/*******************************************************

code of printInt - returns length of characters printed

********************************************************/

int printInt(int n) 
{
	char arr[30], z='0';
	int i = 0, j, k, size;
	if(n == 0) arr[i++]=z;
	else
	{
		if(n < 0) 
		{
			arr[i++]='-';
			n = -n;
		}
		while(n)
		{
			int d = n%10;
			arr[i++] = (char)(z+d);
			n/= 10;
		}

		if(arr[0] == '-') j = 1;
		else j = 0;
		k=i-1;

		while(j<k)
		{
			char temp=arr[j];
			arr[j++] = arr[k];
			arr[k--] = temp;
		}
	}
	arr[i]='\n';
	size = i+1;
	__asm__ __volatile__(
		"movl $1, %%eax \n\t"
		"movq $1, %%rdi \n\t"
		"syscall \n\t"
		:
		:"S"(arr), "d"(size)
	);
	int l = size-1;
	return l;
}

/*******************************************************

code of readFlt returns 1 if OK and 0 if ERR

********************************************************/

int readFlt(float *f)
{
	char arr[1];
		char fl[15];
		float n=0;
		int len=0,i,k=0;

		while (1) 
		{
			
		 __asm__ __volatile__ ("syscall"::"a"(0), "D"(0), "S"(arr), "d"(1));
			if(arr[0]=='\t'||arr[0]=='\n'||arr[0]==' ') 
			{
				break;
			}
			else 
			{
				if (((int)arr[0]-'0'>9||(int)arr[0]-'0'<0)&&arr[0]!='-'&&arr[0]!='.') 
				{
					return 0;
				}
				else
				{
					fl[len++]=arr[0]; 
				}
			}
		}
			
		float mul=1.0;
		if(len>15||len==0)
		{
			*f=0.0;
			return 0;
		}
		if(fl[0]=='.') 
			{return 0;}

		if (fl[0]=='-') 
		{
			if(len==1) 
			{
				*f=0.0;
				return 0;
			}
			if(fl[1]=='.') return 0;
			for (i=1;i<len;i++) 
			{
				if(fl[i]=='-') return 0;
				if(fl[i]=='.'&&k==1) return 0;
				if(fl[i]=='.'&&k==0) 
				{
					k=1;
					continue;
				}
				if(k) 
				{
					mul*=10.0;
					n+=(float)((int)fl[i]-'0')/mul;
				}
				else
				{
					n*=10;
					n+=(float)((int)fl[i]-'0');
				}
			}
			n=-n;
		}

		else
		{
			for (i=0;i<len;i++) 
			{
				if(fl[i]=='-') return 0;
				if(fl[i]=='.'&&k==1) return 0;
				if(fl[i]=='.'&&k==0) 
				{
					k=1;
					continue;
				}
				if(k) 
				{
					mul*=10.0;
					n+=(float)((int)fl[i]-'0')/mul;
				}
				else
				{
					n*=10;
					n+=(float)((int)fl[i]-'0');
				}
			}
		}

		*f=n;
		return 1;
} 

/*******************************************************

code of printFlt - returns number of characters printed 

********************************************************/

int printFlt(float f)
{
	char arr[80];
	//printf("%f\n",f);
		int i=0,j,c=0,k,size;
		if (f==0) arr[i++]='0';
		else {
			if(f<0) 
			{
				arr[i++]='-';
				f=-f;
			}

			while (f!=(int)f) 
			{	
				f*=10;
				c++;
			}
			//printf("%d\n",c);

			int d=0,n=(int)f;
			if (c==0) c=-2;
			while (n) 
			{
				if (c==0) 
				{
					arr[i++]='.';
					c=-2;
				}
				else 
				{
					d=n%10;
					arr[i++]=(char)(d+'0');
					n/=10;
					c--;
				}
			}
			if(arr[0]=='-') j=1;
			else j=0;
			k=i-1;
			char temp;
			/*reversing the array*/
			while (j<k) 
			{
				temp=arr[j];
				arr[j++]=arr[k];
				arr[k--]=temp;
			}
		}
		size=i;

		/*inline asm commands for system call to print "arr" till "size" length to STDOUT*/
		__asm__ __volatile__ (
		"movl $1, %%eax \n\t"
		"movq $1, %%rdi \n\t"
		"syscall \n\t"
		:
		:"S"(arr),"d"(size)
		);
		//printf("%d\n",size);
	return size;

}
