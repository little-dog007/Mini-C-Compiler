/* lexical analysis*/

#include "global.h"
#include "structure.h"

#define BUFLEN  256


/* export var and function */
int tkvalue = 0;   /* value of word */
E_TokenType token; /* token of word*/
DynString tkstr;   /* token the corresponding string */
void getToken();

/* local var*/
static char ch = '0';
static char per_ch = '/';
static const char *keyWord[7] = {
    "int", "void", "if", "else", "while", "break", "return"};

/*we can use tokenName[token]  debugging*/
const char *TokenName[40] = {
    "TK_PLUS",      //+
    "TK_MINUS",     //-
    "TK_STAR",      //*
    "TK_DIVIDE",    // /
    "TK_EQ",        //==
    "TK_NEQ",       //!=
    "TK_LT",        //<
    "TK_LEQ",       // <=
    "TK_GT",        //>
    "TK_GEQ",       //>=
    "TK_ASSIGN",    //=
    "TK_OPENPA",    //(
    "TK_CLOSEPA",   //)
    "TK_OPENBR",    //[
    "TK_CLOSEBR",   //]
    "TK_BEGIN",     //{
    "TK_END",       //}
    "TK_SEMICOLON", // ；
    "TK_COMMA",     //，

    /*key word*/
    "KW_CINT",   //int常量
    "KW_INT",    //int
    "KW_VOID",   //void
    "KW_IF",     //if
    "KW_ELSE",   //else
    "KW_WHILE",  //while
    "KW_BREAK",  //break
    "KW_RETURN", //return
    "TK_EOF",    //EOF
    "TK_IDENT"   // id
};
static int line_wrap = 0; // space space is 1,\t is f2
static int line_feed = 1; // begin is 1,/n is 2
static int linepos = 0;
static int bufsize = 0;
static char lineBuf[BUFLEN];


/* extern */
extern fstream source;


static void getch()
{
    if(!(linepos < bufsize)){
        line_num++;
        if(source.getline(lineBuf,BUFLEN)){
            bufsize = strlen(lineBuf);
            linepos = 0;
            ch = lineBuf[linepos++];
        }
        else{
        ch = EOF;
        }
    }
    else{
        ch = lineBuf[linepos++];
    }
    
}

/* ignore comments */
static void skip_white_space()
{

    while (ch == ' ' || ch == '\t' || ch == '\r' || ch == '\n')
    {
        if (ch == '\n')
        {
            if (line_feed == 0)
                line_feed = 2;
        }

        if (ch == '\r')
        {
            // getch();
            // if (ch != '\n')
            // {
            //     throwError("this is err about file coding");
            //     return;
            // }
            if (line_feed == 0)
                line_feed = 2;
        }
        if (ch == ' ')
        {
            line_wrap += 1;
        }
        if (ch == '\t')
            line_wrap += 4;
        getch();
    }
}
static void parse_comment()
{
    getch();
    do
    {
        do
        {
            if (ch == '\n' || ch == '*' || ch == EOF)
                break;
            else
                getch();
        } while (1);
        if (ch == '\n')
        {
            line_num++;
            getch();
        }
        else if (ch == '*')
        {
            getch();
            if (ch == '/')
            {
                getch();
                return;
            }
        }
        else
        {
            throwError("miss */");
        }
    } while (1);
}

/* pretreatment */
static void preprocess()
{
    while (1)
    {
        if (ch == ' ' || ch == '\t' || ch == '\r' || ch == '\n')
            skip_white_space();
        else
        {
            if (ch == '/')
            {
                getch();
                if (ch == '*')
                {
                    parse_comment();
                }
                else
                {
                    per_ch = ch;
                    ch = '/';
                    break;
                }
            }
            else
                break;
        }
    }
}

static bool inline is_letter(char c)
{
    return (c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z') || c == '_';
}

static bool inline is_digit(char c)
{
    return (c >= '0' && c <= '9');
}

// check if id is keyword
static void compare_identifier()
{
    int i = 0;
    for (; i < 7; i++)
    {
        if (strcmp(tkstr.data, keyWord[i]) == 0)
        {
            break;
        }
    }

    token = (E_TokenType)(21 + i);
}

/* parse id name*/
static void parse_identifier()
{
    tkstr.dynstring_reset();
    tkstr.dynstring_chcat(ch);
    getch();
    while (is_letter(ch) || is_digit(ch))
    {
        tkstr.dynstring_chcat(ch);
        getch();
    }
    tkstr.dynstring_chcat('\0');
    compare_identifier();
}

/* parse num*/
static void parse_num()
{
    tkstr.dynstring_reset();
    do
    {
        tkstr.dynstring_chcat(ch);
        getch();
    } while (is_digit(ch));
    tkstr.dynstring_chcat('\0');
    tkvalue = atoi(tkstr.data);
}

/* +，-，*，/，<,>,=,,,;,(,),[,],{,} */
static void inline addch(char c)
{
    tkstr.dynstring_reset();
    tkstr.dynstring_chcat(c);
    tkstr.dynstring_chcat('\0');
}
/* <=,>=,==,!= */
static void inline add2ch(char c, char h)
{
    tkstr.dynstring_reset();
    tkstr.dynstring_chcat(c);
    tkstr.dynstring_chcat(h);
    tkstr.dynstring_chcat('\0');
}

void getToken()
{
    preprocess();
    switch (ch)
    {
    case 'a':
    case 'b':
    case 'c':
    case 'd':
    case 'e':
    case 'f':
    case 'g':
    case 'h':
    case 'i':
    case 'j':
    case 'k':
    case 'l':
    case 'm':
    case 'n':
    case 'o':
    case 'p':
    case 'q':
    case 'r':
    case 's':
    case 't':
    case 'u':
    case 'v':
    case 'w':
    case 'x':
    case 'y':
    case 'z':
    case 'A':
    case 'B':
    case 'C':
    case 'D':
    case 'E':
    case 'F':
    case 'G':
    case 'H':
    case 'I':
    case 'J':
    case 'K':
    case 'L':
    case 'M':
    case 'N':
    case 'O':
    case 'P':
    case 'Q':
    case 'R':
    case 'S':
    case 'T':
    case 'U':
    case 'V':
    case 'W':
    case 'X':
    case 'Y':
    case 'Z':
    case '_':
        parse_identifier();
        break;
    case '0':
    case '1':
    case '2':
    case '3':
    case '4':
    case '5':
    case '6':
    case '7':
    case '8':
    case '9':
        parse_num();
        token = TK_CINT;
        break;
    case '+':
        token = TK_PLUS;
        addch('+');
        getch();
        break;
    case '-':
        getch();
        addch('-');
        token = TK_MINUS;
        break;

    case '/':
        token = TK_DIVIDE;
        addch('/');
        ch = per_ch;
        break;
    case '=':
        getch();
        if (ch == '=')
        {
            token = TK_EQ;
            add2ch('=', '=');
            getch();
        }
        else
        {
            addch('=');
            token = TK_ASSIGN;
        }
        break;
    case '!':
        getch();
        if (ch == '=')
        {
            token = TK_NEQ;
            add2ch('!', '=');
            getch();
        }
        else
            throwError("we only support != !");
        break;

    case '<':
        getch();
        if (ch == '=')
        {
            token = TK_LEQ;
            add2ch('<', '=');
            getch();
        }
        else
        {
            addch('<');
            token = TK_LT;
        }
        break;
    case '>':
        getch();
        if (ch == '=')
        {
            token = TK_GEQ;
            add2ch('>', '=');
            getch();
        }
        else
        {
            addch('>');
            token = TK_GT;
        }
        break;
    case ';':
        token = TK_SEMICOLON;
        getch();
        addch(';');
        break;
    case '[':
        token = TK_OPENBR;
        addch('[');
        getch();
        break;
    case ']':
        token = TK_CLOSEBR;
        addch(']');
        getch();
        break;
    case '{':
        token = TK_BEGIN;
        addch('{');
        getch();
        break;
    case '}':
        token = TK_END;
        addch('}');
        getch();
        break;
    case '(':
        token = TK_OPENPA;
        addch('(');
        getch();
        break;
    case ')':
        token = TK_CLOSEPA;
        addch(')');
        getch();
        break;
    case ',':
        token = TK_COMMA;
        addch(',');
        getch();
        break;
    case '*':
        token = TK_STAR;
        addch('*');
        getch();
        break;
    case EOF:
        token = TK_EOF;
        break;
    default:
        throwError("this char we do not support,leaving compile!\n");
        goto err;
    }
    return;
err:
    error = FATALERROR; /* we have to leave compile*/
    return;
}
/*before compile,we should call this function first*/
void init_compile_callonce(){
    getch();
}

/*int window*/
static void color_token()
{
    if (token == TK_IDENT) /* id */
        printf("\033[;31m %s\033[5m", tkstr.data);
    else if (token > TK_CINT) /*keyword*/
        printf("\033[;32m %s\033[5m", tkstr.data);
    else if (token == TK_CINT) /* const int */
        printf("\033[;37m %s\033[5m", tkstr.data);
    else
        printf("\033[;34m %s\033[5m", tkstr.data);
}

/* test */
void test_lex()
{
    init_compile_callonce();
    while (1)
    {
        getToken();
        if (token == TK_EOF)
            break;
        switch (line_feed)
        {
        case 1:
            /*this only happend at begin*/
            printf("\033[;34m%d:  \033[5m", line_num);
            break;
        case 2:
            cout<<endl;
            printf("\033[;34m%d:  \033[5m", line_num);
            break;
        default:
            break;
        }
        for (; line_wrap > 0; line_wrap--)
        {
            cout << " ";
        }
        line_wrap = 0;
        line_feed = 0;
        color_token();
        
    }
    cout<<endl;
}
