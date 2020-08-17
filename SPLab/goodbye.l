%option noyywrap
%%
"hello" printf("Good bye!");
.+;
%%
int main()
{
yylex();
}

