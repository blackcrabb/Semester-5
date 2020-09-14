%option noyywrap
%{
	
	void function2(char *,int);
%}
%%
[a-zA-Z0-9 ]+ {function2(yytext,yyleng);}
%%
int main()
{
	printf("\n enter string: ");
	yylex();
}

void function2(char *a,int length)
{
	for(int i=0;i<length;i++)
	{
		for(int j=0;j<length-i;j++)
		printf("%c",a[j]);
		printf("\n");
	}
}