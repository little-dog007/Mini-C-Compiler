#pragma once
/* structure used in lexical analysis*/

/*mini C token*/
 enum E_TokenType {
    //+,-,*,/,==,!=,<,<=,>,>=,=
    TK_PLUS,TK_MINUS,TK_STAR,TK_DIVIDE,TK_EQ,TK_NEQ,TK_LT,TK_LEQ,TK_GT, TK_GEQ, TK_ASSIGN,
    //(,),[,],{,},; ,,
    TK_OPENPA,TK_CLOSEPA,TK_OPENBR,TK_CLOSEBR,TK_BEGIN,TK_END,TK_SEMICOLON,TK_COMMA,
	TK_EOF,   //EOF
    //num，int,void,if,else,while,break,return,
    TK_CINT,KW_INT,KW_VOID,KW_IF,KW_ELSE,KW_WHILE,KW_BREAK,KW_RETURN,
	
    TK_IDENT // identifier
};

class DynString {
public:
	DynString();
	~DynString();
    void dynstring_init(int initSize); /* init */
	void dynstring_free();		/* free mem */
	void dynstring_reset();		/* reset  */
	void dynstring_realloc(int new_size); /* realloc */
	void dynstring_chcat(int ch);   /* append a char */
public:
	int count; /* length */
	int capacity; /* max length */
	char* data; /* point to data */
};

/* like DynString
   the difference is data is secondary pointer,use this to 
   reduction in data transfer when we have to call 
*/

class DynArray {
public:
	DynArray();
	~DynArray();
	void dynarray_init(int initsize);
	void dynarray_add(void* new_data);
	void dynarray_realloc(int new_size); 
	int dynarray_search(int key);
	void dynarray_free();
public:
	int count;
	int capacity;
	void** data;
};