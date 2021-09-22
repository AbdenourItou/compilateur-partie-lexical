#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/*++++LA TABLE DES SYMBOLES +++++*/

typedef struct
{
int state;
char name[20];
char type[20];
float val;
} elementIDF;
typedef struct
{
int state;
char name[20];
char type[20];
} elt;
elementIDF tabIDF[200];
elt tabs[40],tabm[40];


void rechercher (char entite[ ], char type [ ], float val, int y);
void inserer (char entite[], char type[], float val, int i, int y);
void afficher();
void initialisation();


/*initialiser les etats  state à 0 */
void initialisation()
{
	int i;
for (i=0;i<200; i++)
	tabIDF[i].state=0;
for (i=0;i<40;i++)
		{
			tabs[i].state=0;
			
		}
for (i=0;i<40;i++)
		{
			tabm[i].state=0;
		}
}




void rechercher (char entite[ ], char type [ ], float val, int y)
{
int i;
switch (y)
{
case 0: /*verifier si la case dans la tables des IDF et CONST est libre*/
for (i=0;(( i<200) &&(tabIDF[i].state==1)) && (strcmp(entite, tabIDF[i].name)!=0); i++);
{if (i<200)
	{inserer( entite, type, val, i , 0);}
else
	printf("entité existe déjà dans la table \n"); }

break;


case 1:  /*verifer si la case dans la tables des mots clés est libre*/
for (i=0;((i<40)&&(tabm[i].state==1))&&(strcmp(entite,tabm[i].name)!=0);i++);
{if (i<40)
	inserer(entite,type,val,i,1);
else
	printf ("entité existe déjà\n");}
break;

case 2: /*verifer si la case dans la tables des séparateurs est libre*/
for (i=0;((i<40)&&(tabs[i].state==1))&&(strcmp(entite,tabs[i].name)!=0);i++);
{if (i<40)
	inserer(entite,type,val,i,2);
else
	printf("entité existe déjà\n");}

break;
} 
}
void inserer (char entite[], char type[], float val, int i, int y)
{
switch (y)
{
case 0: /*insertion dans la table des IDF et CONST et mise à jour de state à 1*/
{tabIDF[i].state=1;
strcpy (tabIDF[i].name, entite);
strcpy (tabIDF[i].type, type);
tabIDF[i].val=val;
}break;
case 1: /*insertion dans la table des mots clés*/
{tabm[i].state=1;
strcpy (tabm[i].name,entite);
strcpy (tabm[i].type,type);
 
}break;
case 2: /*insertion dans la table des séparateurs et des operateurs*/
{tabs[i].state=1;
strcpy (tabs[i].name,entite);
strcpy (tabs[i].type,type);
}break;
} 
}


void afficher()
{
	/*affichage de la table de symboles des IDF et CST */
	int i;
	printf("*********La table des IDF et CST  ***********************\n") ; 
for (i=0;i<200;i++)
{
	if(tabIDF[i].state==1)
	{
	printf("L entite :   %s \n" ,tabIDF[i].name);
	printf("Type :       %s \n" ,tabIDF[i].type);
	/*if((strcmp(tabIDF[i].type=="reel")) ||(strcmp(tabIDF[i].type=="Int")==0))*/
	printf("valeur       %f \n" ,tabIDF[i].val);
	

	}
	
	
}

/*affichage de la table de symboles  des mots clés*/

printf("*********La table Mots Cles *******************\n") ; 
for (i=0;i<40;i++)
{
	if(tabm[i].state==1)
	{
	printf("L entite  : %s \n" ,tabm[i].name);
	printf("Type      : %s \n" ,tabm[i].type);
	
	

	}
}

/*affichage de la table de symboles des séparateurs et operateurs*/
printf("*********La table des Operateurs et Separateurs \n") ; 

for (i=0;i<40;i++)
{
	if(tabs[i].state==1)
	{
	printf("L entite: %s \n" ,tabs[i].name);
	printf("Type :    %s \n" ,tabs[i].type);

	}
	
	
}
	
	
}
	
	


