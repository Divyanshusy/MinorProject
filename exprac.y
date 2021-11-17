%{
	//2019CSC1024 Divyanshu Singh Yadav


	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>
	
	int yylex();
	void yyerror(char*);
	void addcell(char*);
	int rn,cn;
%}

%union{
	int intval;
	char charval;
	char* strval;
}

%token <intval> COMMA NLINE HEADER
%token <strval> VAR

 
%start startnode

%%

startnode:line		{printf("\n\nHTML CREATED SUCCESSFULLY--\n\n\n\n");};
line: VAR COMMA VAR COMMA VAR COMMA VAR COMMA VAR	{addcell($1);};


	
%%

void addcell(char *temp){
	char* a,b,c,d,e;
	int len=strlen(temp);
	
	int change
	for (int i=0; i<len; i++){
		if(temp[i]==','){
			printf("Here\n");
			printf("%s", data);
			//clear data
		}
		else{
		data[i]=temp[i];
		}
	}
	
}


void main(){
	char* headcode= "<thead>\n";
	char* bodycode="<tbody>\n";
	char* footcode="<tfoot>\n";

	extern FILE *yyin, *yyout;
	yyin = fopen("data2.csv", "r");
	yyout = fopen("result.html", "w");
	char *code = "<html>\n<table border=\"yes\">";
	fprintf(yyout, code);
	
	for(int i=1; i<=2; i++){
		yyparse();
	}
	
	code="";
	strcat(headcode, "</thead>\n");
	strcat(bodycode, "</tbody>\n");
	strcat(footcode, "</tfoot>\n");
	strcat(code, headcode);
	strcat(code, bodycode);
	strcat(code, footcode);
	strcat(code,"\n</table>\n</html>" );
	fprintf(yyout, code);
}

void yyerror(char* s){
	fprintf(stderr, "%s\n", s);
	exit(0);
}
