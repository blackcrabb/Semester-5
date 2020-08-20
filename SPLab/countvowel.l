%option noyywrap
%{
/* To count vowel in a sentence  */
int count=0;
void display(int);
%}

%%

[aeiouAEIOU] { count++;}
.
\n { printf("There are {%d} vowels in this sentence",count); return 1; }

%%


int main()
{
	printf("Enter a sentence");
	yylex();
	return 0;
}
