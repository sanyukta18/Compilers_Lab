#include<stdio.h>
#include "my1.h"
#include "ass2_19CS30016.c"

int main()
{
	printf("%s\n","Main function for testing functions in my1.h\0");
	//printchar
	printf("%s\n","Testing printStr:\0");
	char c[13] = "HELLO WORLD!\0";
	printStr(c);

	//readInt
	printf("%s\n","Give an integer as input:(Testing readInt)\0");
	int n; int l;
    l = readInt(&n);
    printf("%s:%d\n","You entered\0",n);

    //printInt
    printf("%s\n","Testing printInt\0");
    int k = 15000;
    printInt(k);

    //readFlt
    printf("%s\n","Give a floating point as input:(Testing readFlt)\0");
    float n1;
	int l1 = readFlt(&n1);
	printf("%f\n",n1);
	char s1[6] = "Error\0";
	char s2[5] = "Pass\0" ;
	if(l1 == 1)
	 printf("%s",s2);
	else
		printf("%s",s1);
	printf("\n");
	printf("%s:%f\n","You entered\0",n1);

	//printflt
	 printf("%s\n","Testing printflt\0");
	float n3 = 123.4;
	int s = printFlt(n3);
	//printf("\n%d",s);

	return 0;
	
}