/* this is a mini C compiler 

   mini C supported syntax:
   keyword: else if int return void while
   symbol: 
        +  -  *  /  <  <=  >   >=   ==  != 
        =  ;  ,  [  ]  {   }   (    )   /*  
   default function: input(x)  output(x)

*/

#include "global.h"

/* if CODE = 1, generate code,disable SYNTREE,LEX
   if SYNTREE = 1,show syntree,disable LEX
   if lex = 1,show lex
*/
#define LEX 0
#define SYNTREE 0
#define CODE 1

#if CODE
void gencode();
#define compile() gencode();
#else
#if SYNTREE
void testSyntree();
#define compile() testSyntree();
#else
void test_lex();
#define compile() test_lex();
#endif
#endif

/* allocate global variables*/
fstream source;
fstream listing;
int line_num = 1;  /* num of line */
E_ErrorType error;

int main(int argc, char *argv[])
{
    char filename[125]; /*file name*/
    char destname[125]; /*dest name*/
    if (argc != 2)
    {
        cout << "enter filename!\n"
             << endl;
        return 1;
    }
    strcpy(filename, argv[1]);
    cout << filename;
    if (strchr(filename, '.') == NULL)
        strcat(filename, ".c");
    int i = 0;
    for (; i < strlen(filename); i++)
    {
        if (filename[i] == '.')
            break;
        destname[i] = filename[i];
    }
    /* code save in file *.tm*/
    destname[i++] = '.';
    destname[i++] = 't';
    destname[i++] = 'm';
    destname[i] = '\0';

    source.open(filename, ios::in);
    listing.open(destname, ios::out);

    compile();
}