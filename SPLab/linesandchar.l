%option noyywrap
%{
/* To count the number of lines and characters in the input file */
#include <stdio.h>
int count=0;
int lines=1;
int flag=0;
%}

%%
<<EOF>> { flag=1; return 0; }
[\n] { lines++; count++;}
. { count++;}

%%


int main()
{
   	yyin = fopen("myfile.txt","r");
	yylex();
	if( flag==1 && count==0)
	{ printf("File is empty \n"); 
		return 0;}
	printf(" There are [%d] lines and",lines); 
	printf(" there are [%d] characters",count);
	return 1;
}
