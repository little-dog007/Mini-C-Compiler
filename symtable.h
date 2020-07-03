/* structure of symtable*/

#pragma once

#include"syntax.h"

/*size of hash table */
#define SIZE 211

// align of hash function
#define SHIFT 4

// symtable struct
struct sym{
    SingalNode *sym_node;  /* point to node*/
    int sym_level;  /*level of var*/    
    sym *sym_next;  /*next symbal*/

    sym(SingalNode*node,int level):sym_node(node),sym_level(level),sym_next(NULL){}
  
};

/* function table ,store symbo of function,so we can call*/
struct funcTable{
    const char * name;
    int offset;     /* address of func in code*/
    int memlength;  /* size of all local var*/
    int paramlength;    /* size of paramlength*/
    funcTable *next;
    funcTable(const char *name,int offset):name(name),offset(offset),memlength(0),paramlength(0),next(NULL){}
};



void sym_insert(SingalNode *node, int loc, int level); /*insert symbol,loc->address,level->scope of var*/
void sym_delete(int lev);                              /* delete symbol  when symbol->level == lev*/
void sym_lookup(SingalNode *node);                     /*search symbol*/
void sym_pop(int key, sym *symbal);                    /*delete symbol*/
void sym_push(int key, sym *symbal);                   /*add symbol*/
int symhash(const char *name);                            /*hash function*/

