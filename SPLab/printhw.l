%option noyywrap
%%
.*\n {printf("Hello world!");}
%%
int main()
{
yylex();
}