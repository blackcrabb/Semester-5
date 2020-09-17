%option noyywrap
%{
	int i=0,j=0;
%}

%%
[a-zA-Z]+ {
		for(i=yyleng-1;i>=0;i--)
		{
			for(j=0;j<=i;j++)
			{
				printf("%c" , yytext[j]);
			}
			printf("\n");
		}
		return 0;
}
%%
int main()
{
	yylex();
	return 0;
}