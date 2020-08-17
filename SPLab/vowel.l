%option noyywrap
%{
/* To find whether given letter is a vowel or not */
void display(int);
%}

%%

[aeiouAEIOU] { display(1); return 1; }

.+ { display(0); return 1; }

%%

void display(int flag)
{
  if(flag==1)
	printf("The given letter [%s] is a vowel",yytext);
  else
	printf("The given letter [%s] is NOT a vowel",yytext);
}

int main()
{
	printf("Enter a letter to check if it is vowel or not");
	yylex();
	return 0;
}
