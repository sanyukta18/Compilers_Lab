%{
	#define KEYWORD 		10
	#define	IDENTIFIER	 	11
	#define	CONSTANT		12
	#define STRING_LITERAL 	13
	#define PUNCTUATOR		14
	#define COMMENT			15
%}

/***keyword ***/

KEYWORD 	"auto"|"enum"|"restrict"|"unsigned"|"break"|"extern"|"return"|"void"|"case"|"float"|"short"|"volatile"|"char"|"for"|"signed"|"while"|"const"|"goto"|"sizeof"|"_Bool"|"continue"|"if"|"static"|"_Complex"|"default"|"inline"|"struct"|"_Imaginary"|"do"|"int"|"switch"|"double"|"long"|"typedef"|"else"|"register"|"union"

/*** Identifier ***/
IDENTIFIER_NONDIGIT 		[a-zA-Z]|"_"
DIGIT						[0-9]

IDENTIFIER     				{IDENTIFIER_NONDIGIT}({IDENTIFIER_NONDIGIT}|{DIGIT})*
 
/* integer-constant */
NONZERO_DIGIT 				[1-9] 

INTEGER_CONSTANT 			{NONZERO_DIGIT}({NONZERO_DIGIT}|{DIGIT})*

/* floating-constant */

DIGIT_SEQUENCE  			{DIGIT}+
EXPONENT_PART               ("e"{SIGN}?{DIGIT_SEQUENCE})|("E"{SIGN}?{DIGIT_SEQUENCE})
SIGN 						"+"|"-"
FRACTIONAL_CONSTANT         ({DIGIT_SEQUENCE}?"."{DIGIT_SEQUENCE})|({DIGIT_SEQUENCE}".")
 
FLOATING_CONSTANT  		 	({FRACTIONAL_CONSTANT}{EXPONENT_PART}?)|({DIGIT_SEQUENCE}{EXPONENT_PART})

/* enumeration constant */
ENUMERATION_CONSTANT		{IDENTIFIER}

/* character constant */
ESCAPE_SEQUENCE				"\'"|"\""|"\?"|"\\"|"\a"|"\b"|"\f"|"\n"|"\r"|"\t"|"\v"
C_CHAR    					{ESCAPE_SEQUENCE}|[^("\'"|"\\"|"\n")]
C_CHAR_SEQUENCE	 			{C_CHAR}+
CHARACTER_CONSTANT			"\'"{C_CHAR_SEQUENCE}"\'"

/*** constants***/
CONSTANT					{INTEGER_CONSTANT}|{FLOATING_CONSTANT}|{ENUMERATION_CONSTANT}|{CHARACTER_CONSTANT}

/*** string literal ***/
S_CHAR  					{ESCAPE_SEQUENCE}|[^("\""|"\\"|"\n")]
S_CHAR_SEQUENCE				{S_CHAR}+
STRING_LITERAL 				"\""{S_CHAR_SEQUENCE}?"\""

/*** punctuators ***/
PUNCTUATOR  				"["|"]"|"("|")"|"{"|"}"|"."|"->"|"++"|"--"|"&"|"*"|"+"|"-"|"~"|"!"|"/"|"%"|"<<"|">>"|"<"|">"|"<="|">="|"=="|"!="|"^"|"|"|"&&"|"||"|"?"|":"|";"|"..."|","|"#"|"="|"*="|"/="|"%="|"+="|"-="|"<<="|">>="|"&="|"^="|"|="

/*** comments ***/
SINGLE_LINE_COMMENT			"//"[^("\n")]*
MULTI_LINE_COMMENT			"/*"[^"*"]*"*"("*"|([^"/*"]*[^"*"]*"*"))*"/"
COMMENT 					{SINGLE_LINE_COMMENT}|{MULTI_LINE_COMMENT}

WS 		   			[ \t\n]

%%

{KEYWORD}				{ return KEYWORD; }
{IDENTIFIER}			{ return IDENTIFIER; }
{CONSTANT} 				{ return CONSTANT; }
{STRING_LITERAL}		{ return STRING_LITERAL; }
{PUNCTUATOR}			{ return PUNCTUATOR; }
{COMMENT}               {return COMMENT;}
{WS}		{/* Ignore whitespace */}


%%