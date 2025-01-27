%{

/* declarations */
#include <stdio.h>

%}
/* definitions */
%option outfile="part1.c"
%option yylineno
%option noyywrap

digit ([0-9])
letter ([a-zA-Z])
whitespace ([ \t\n])
keyword int|float|void|write|read|va_arg|while|do|if|then|else|return
symbol [(){},;:]|\.{3}
id {letter}({letter}|{digit}|_)*
integernum {digit}+
realnum {digit}+\.{digit}+
str \"([^"\\\n\r]|\\[tn"])*\"
relop "=="|"<>"|"<"|"<="|">"|">="
addop "+"|"-"
mulop "*"|"/"
assign "="
and "&&"
or "||"
not "!"
comment "#"[^\n]*

/* rules */
%%

{symbol}			printf("%s", yytext);
{keyword}			printf("<%s>", yytext);
{integernum}	    printf("<integernum,%s>", yytext);
{realnum}           printf("<realnum,%s>", yytext);
{id}				printf("<id,%s>", yytext);
{relop}				printf("<relop,%s>", yytext);
{addop}				printf("<addop,%s>", yytext);
{mulop}				printf("<mulop,%s>", yytext);
{assign}			printf("<assign,%s>", yytext);
{and}				printf("<and,%s>", yytext);
{or}				printf("<or,%s>", yytext);
{not}				printf("<not,%s>", yytext);
{str}				printf("<str,%.*s>", (int)yyleng-2, yytext+1);
{comment}			;
{whitespace}		printf("%s", yytext);

.   { printf("\nLexical error: '%s' in line number %d\n", yytext, yylineno);
	  exit(1);
	}

%%

