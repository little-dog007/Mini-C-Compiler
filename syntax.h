/* structure of syntax*/

#pragma once
#include"global.h"
#include"structure.h"
#include<stack>
#include<queue>

// /* to debug exp function*/
// #define DEBUGEXP 1

/* note: this is different form token type*/
enum NodeType {
    STMT_UNKNOW,
    STMT_ROOT,  // root
    STMT_INT,	// int
    STMT_ARR,  // arr
    STMT_VOID, // void
    STMT_CINT, // const int

    STMT_FUNCTION, // function node
    STMT_CALL, // call node
    STMT_PARAMS,	// params node

    STMT_STATE,	//state node 

    STMT_IF,	// if node
    STMT_ELSE,  //else node
    STMT_WHILE,	// while node
    STMT_BREAK, //break node
    STMT_RETURN,// return node

    STMT_OPENPA, //(
    STMT_CLOSEPA, // )
    STMT_ASSIGN, // =
    STMT_PLUS,	//+
    STMT_MINUS,	//-
    STMT_STAR,	//*
    STMT_DIVIDE,	// /
    STMT_EQ,		//==
    STMT_NEQ,		//!=
    STMT_LT,		//<
    STMT_LEQ,     // <=
    STMT_GT,		//>
    STMT_GEQ,		//>=

};

/* Singal Node can only be leaf node*/
struct SingalNode {
    int type; 
    int defineFlag; /* {int a};{a =1};note they have same node,so we should differentiate them; {int a} is 0;{a} is 1*/
    const char* name;  /* node name*/
    /* this field is important
    1.{a = 5} vlaue =5
    2.{int arr[3]} value = 3
    3.{int arr[]} value = -1
    4.{arr[b]} value = -2 and quote point to b
    */
    int value; 
    SingalNode* quote;
    int memloc; /* locate of node */
    int size; /* size of arr*/
    int global; /*global or local,1 is global,>1 is local,root is 0(no meaning)*/
    /* define node init*/
    SingalNode(int _type, const char* _name):type(_type),defineFlag(0),name(_name),value(-1),quote(NULL),memloc(0){}
    /* quote node init ,the diffent si defineFlag*/
    SingalNode(int _type, const char *_name,int flag):type(_type),defineFlag(flag),name(_name),value(-1),quote(NULL),memloc(0){}
};
/* multinode have data point to other node*/
struct MultiNode :SingalNode {
    DynArray data;
    MultiNode(int type, const char* name) :SingalNode(type, name) {};
};


typedef MultiNode ParamsNode;
typedef MultiNode CallNode;
typedef MultiNode ElseNode;

struct FunctionNode :MultiNode {
    SingalNode* returnType;
    ParamsNode* params;
    FunctionNode(const char* name) :MultiNode(STMT_FUNCTION, name),returnType(NULL),params(NULL) {};
};

struct ExpressNode :SingalNode {
    SingalNode* leftOp;
    SingalNode* rightOp;
    ExpressNode(int _type, const char* _name) :SingalNode(_type, _name),leftOp(NULL),rightOp(NULL){}
};
struct FunctionReturnNode :MultiNode {
    FunctionReturnNode() :MultiNode(STMT_RETURN, "return") {};
};

struct IfNode :MultiNode {
    ExpressNode* exp;
    /*ElseNode* elseNode;*/
    IfNode() :MultiNode(STMT_IF, "if"),exp(NULL){
        /*elseNode = NULL;*/
    }
};

struct WhileNode :MultiNode {
    ExpressNode* exp;
    WhileNode() :MultiNode(STMT_WHILE, "while"),exp(NULL) {}
};

#define SNODE(node)  ((SingalNode*)node)  
#define MNODE(node)  ((MultiNode*)node)  
#define IFNODE(node)  ((IfNode*)node)  
#define WNODE(node)  ((WhileNode*)node)  
#define FNODE(node)  ((FunctionNode*)node)  
#define ENODE(node)  ((ExpressNode*)node)  


/* base tree,nodeTree will inherit it */
class  tree {
public:
    tree();
    virtual void concat() = 0; /* virtual function,subclass have to achieve this function*/
    /* time travel:recording father trajectory*/
    void father_goback(); /* return last locate*/
    void father_forward();/* father = child*/
public:
    void* root; 
    void* father; 
    void* child; 
    stack<void*> history; 
};

/* syntax tree*/
class NodeTree :public tree {
public:
    NodeTree();
    void concat();
    void newChild(NodeType type,const char* name);
};

