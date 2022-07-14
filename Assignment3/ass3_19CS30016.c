#include <stdio.h>
#include "lex.yy.c"


int main()
{
	int token;

	while (token = yylex()) 
	{
	    if (token ==  KEYWORD )
	    {
	    	printf("<KEYWORD, %d, %s>\n", token, yytext);
	    }	
		else 
		{	if (token ==  IDENTIFIER )
			{
	      		printf("<IDENTIFIER, %d, %s>\n", token, yytext);
	      	}	
			else 
			{
				if (token ==  CONSTANT )
				{
	      			printf("<CONSTANT, %d, %s>\n", token, yytext);
	      		}
				else 
				{
					if (token ==  STRING_LITERAL)
	      			{
	      				printf("<STRING_LITERAL, %d, %s>\n", token, yytext);
	      			}
					else 
					{ 
						if (token ==  PUNCTUATOR )
	        			{  
	        				printf("<PUNCTUATOR, %d, %s>\n", token, yytext);
	        			}	
				 		else
	          			{
	          				 printf("<COMMENT, %d, %s>\n",token,yytext);
	          			}
	          		}	
				}	
			}
	    }
	}

	return 0;
}