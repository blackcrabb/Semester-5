%option noyywrap
%{
int ch=0, bl=0, ln=1, wr=0;
%}
%%
[\n] {ln++;wr++;}
[\t] {bl++;wr++;}
[" "] {bl++;wr++;}
[^\n\t] {ch++;}
%%
int main(){
 yyin=fopen("iden.txt","r");  
 yylex();
printf("number of lines are:%d",ln);
printf("number of words are:%d",(wr));
printf("number of blank spaces are:%d",bl);
printf("number of characters are:%d",ch);
	return 0;
}