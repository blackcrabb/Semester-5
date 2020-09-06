%option noyywrap
%{
#include <stdio.h>
%}

multicomm "/*"([^*]|\n|(\*[^/]))*"*"+"/"

%%

cout { printf("\n %s is a keyword",yytext); }

cin { printf("\n %s is a keyword",yytext); }

for { printf("\n %s is a keyword",yytext); }

if { printf("\n %s is a keyword",yytext); }

else { printf("\n %s is a keyword",yytext); }

int { printf("\n %s is a keyword",yytext); }

[0-9]+ { printf("\n %s is an integer literal",yytext); }

[0-9]+.[0-9]+ { printf("\n %s is an float literal",yytext); }

"//".+ { printf("\n %s is a single line comment",yytext); }

[\+\-\*\/] { printf("\n %s is an Arithmetic operator",yytext); }

{multicomm}+ { printf("\n %s is a multiline comment",yytext); }

["][^"]+["] { printf("\n %s is a string literal",yytext); }

= { printf("\n %s is assignment operator",yytext); }

[a-zA-Z_][a-zA-Z_0-9]+ { printf("\n %s is an identifier",yytext); }

[,<>{}] {;}


%%
int main()
{
	yyin = fopen("programfile.txt","r");
	yylex();
	return 1;
}