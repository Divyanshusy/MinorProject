%{
    #include <stdio.h>
    #include <stdlib.h>
    #include "exprac.tab.h"
    
%}

%%

","						{return COMMA;}
"\n"						{return 0;}
"RowNo, ColNo, RowName, ColName, Value"		{return HEADER;}
[a-zA-Z0-9]*(\.[a-zA-Z0-9]*)?(\-[a-zA-Z0-9]*)?	{yylval.strval=yytext; return VAR;}
.                       			{printf("Invalid token......\n"); exit(0);}

%%

int yywrap(){
	return 1;
}
