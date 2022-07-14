#include<stdio.h>
#include<string.h>
#define n 187

int main()
{
    char t[] = "LEXER TEST FOR TINYC";
    char p[] = "LEXER TEST";
    char t1[] = "IDENTIFIER AND KEYWORD FOR TINYC INT";
    int x,a,b ;
    char p1[] = "IDENTIFIER AND KEYWORD TESTED";
    char t2[] = "CONSTANT CHECK";
    char p2[] = "ALREADY DONE BY DEFINING n";
    char t3[] = "PUNCTUATOR TEST";
    if (x != 1)
        char pat3[] = "THERE WAS A PUNCTUATOR ";
    else
        char pat3[] = "IS DONE AS EVERY LINE HAS A PUNCTUATOR";
    char txt4[] = "STRING LITERAL TEST DONE IN ABOVE LINES";
    // SINGLE LINE COMMENT TEST
    /* MULTILINE COMMENT TEST
      this is line 2
    tester for lexer in c */
    char pat[] = "COMMENT TEST ALSO DONE";
    
    return 0;
}