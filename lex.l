%{
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "TS.h"
int Col=1;
int yylineo=1;



%}
%option noyywrap
IF		"IF"
ELSE	"ELSE"
ENDIF	"ENDIF"
FOR		"FOR"
ENDFOR	"ENDFOR"
RETURN "RETURN"
let    "let"
SHOW "SHOW"
GET "GET"
BEGIN "BEGIN"
END "END"
PROGRAM "PROGRAM"
var "var"
FLOAT "FLOAT"
INTEGER "INTEGER"
CHAR "CHAR"
STRING "STRING"
lettre [a-zA-Z]
Idf	[A-Z]([a-z]|[0-9])+
entier	[0-9]+|\(\-[0-9]+\)
reel	[0-9]+"."[0-9]+|\(\-[0-9]+"."[0-9]+\)
car "'"{lettre}"'"
chaine <<{lettre}+>>
Comment "//"(.|\n)*?"//"

fin_inst "£"
egal	"=="
diff	"<<>>"
sup     ">>"
inf     "<<"
supG	">>="
infG	"<<="
plus    "+"
moins   "-"
multi   "*"
divis   "/"
blanc [ \t]
Sl [\n]
%%
{PROGRAM} {rechercher (yytext,"Motcle",0,1);
Col=Col+strlen(yytext);
}
{FLOAT} {rechercher (yytext,"Motcle",0,1);
Col=Col+strlen(yytext);
}
{INTEGER} {rechercher (yytext,"Motcle",0,1);
Col=Col+strlen(yytext);
}
{CHAR} {rechercher(yytext,"Motcle",0,1);
Col=Col+strlen(yytext);
}
{STRING} {rechercher (yytext,"Motcle",0,1);
Col=Col+strlen(yytext);
}
{RETURN} {rechercher (yytext,"Motcle",0,1);
Col=Col+strlen(yytext);
}
{var} {rechercher (yytext,"Motcle",0,1);
Col=Col+strlen(yytext);
}
{let} {rechercher (yytext,"Motcle",0,1);
Col += yyleng;}
{GET} {rechercher (yytext,"Motcle",0,1);
Col=Col+strlen(yytext);
}
{END} {rechercher (yytext,"Motcle",0,1);
Col=Col+strlen(yytext);
}
{BEGIN} {rechercher (yytext,"Motcle",0,1);
Col += yyleng;}
{IF} {rechercher (yytext,"Motcle",0,1);
Col=Col+strlen(yytext);
}
{ELSE} {rechercher (yytext,"Motcle",0,1);
Col=Col+strlen(yytext);
}
{ENDIF} {rechercher (yytext,"Motcle",0,1);
Col=Col+strlen(yytext);
}
{FOR} {rechercher (yytext,"Motcle",0,1);
Col=Col+strlen(yytext);
}
{ENDFOR} {rechercher (yytext,"Motcle",0,1);
Col=Col+strlen(yytext);
}
{SHOW} {rechercher (yytext,"Motcle",0,1);
Col=Col+strlen(yytext);
}

"||" {rechercher (yytext,"separateur",0,2);
Col=Col+strlen(yytext);
}
"@" {rechercher (yytext,"separateur",0,2);
Col=Col+strlen(yytext);
}
"%" {rechercher (yytext,"separateur",0,2);
Col=Col+strlen(yytext);
}
"#" {rechercher (yytext,"separateur",0,2);
Col=Col+strlen(yytext);
}
"$" {rechercher (yytext,"separateur",0,2);
Col=Col+strlen(yytext);
}
"&" {rechercher (yytext,"separateur",0,2);
	 Col=Col+strlen(yytext);}
":" {rechercher (yytext,"separateur",0,2);
	 Col=Col+strlen(yytext);}
")" {rechercher (yytext,"separateur",0,2);
	 Col=Col+strlen(yytext);}
"(" {rechercher (yytext,"separateur",0,2);
	 Col=Col+strlen(yytext);}
"}" {rechercher (yytext,"separateur",0,2);
	 Col=Col+strlen(yytext);}
"{" {rechercher (yytext,"separateur",0,2);
	 Col=Col+strlen(yytext);}

{plus} {rechercher (yytext,"separateur",0,2);
Col=Col+strlen(yytext);
}
{moins} {rechercher (yytext,"separateur",0,2);
Col=Col+strlen(yytext);
}
{multi} {rechercher (yytext,"separateur",0,2);
Col=Col+strlen(yytext);
}
{divis} {rechercher (yytext,"separateur",0,2);
Col=Col+strlen(yytext);
}
{egal} {rechercher (yytext,"OPlogique",0,2);
Col=Col+strlen(yytext);
}
{diff} {rechercher (yytext,"OPlogique",0,2);
Col=Col+strlen(yytext);
}
{supG} {rechercher (yytext,"OPlogique",0,2);
Col=Col+strlen(yytext);
}
{infG} {rechercher (yytext,"OPlogique",0,2);
Col=Col+strlen(yytext);
}
{sup} {rechercher (yytext,"OPlogique",0,2);
Col=Col+strlen(yytext);
}
{inf} {rechercher (yytext,"OPlogique",0,2);
Col=Col+strlen(yytext);
}
{fin_inst} {rechercher (yytext,"separateur",0,2);
Col=Col+strlen(yytext);
}
{reel} {rechercher (yytext,"reel",atof(yytext),0);
Col=Col+strlen(yytext);
}
{entier} {
	if(atoi(yytext) > 32767) {printf("entier %s non recoonnu ,il depasse 32767 a la ligne %d  \n",yytext,yylineo);}
		else if (atoi(yytext) < (-32768)) {printf("entier %s non recoonnu ,il est moin de -32768, a la ligne %d  \n",yytext,yylineo); }
		 	else rechercher (yytext,"entier",atoi(yytext),0);
Col=Col+strlen(yytext);
}
{car} {
rechercher (yytext,"car",0,0);
Col=Col+strlen(yytext);
}
{chaine} {
rechercher(yytext,"chaine",0,0);
Col=Col+strlen(yytext);
}
{Idf} {if(yyleng > 8)
			printf("erreur :l'Idf  %s depasse 8 car a la ligne %d \n",yytext,yylineo);
	  else
rechercher (yytext,"IDF",0,0);
Col=Col+strlen(yytext);
}
{Sl} {yylineo++;Col=1;}
{Comment} {printf("commentaire recoonnu a la ligne %d \n",yylineo);}
{blanc} {Col=Col+yyleng;}
. {printf("mot %s non reconnu !,erreur lexicale a la ligne %d \n",yytext,yylineo); Col += yyleng;}
%%
int main ()
{
initialisation();

yyin = fopen("acad.txt","r");
if (yyin==NULL) printf("ERROR \n");
else yylex();
afficher();
} 
/* a faire int et float negative et  ,tableau */
