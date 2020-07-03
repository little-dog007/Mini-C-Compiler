/* generating syntax tree,entry function:program*/
#include "syntax.h"
#include"symtable.h"

/*extern function and var from lex.cpp*/
extern DynString tkstr;
extern E_TokenType token;
extern int tkvalue;
extern void init_compile_callonce();
extern void getToken();

/*extern var from symtable.c*/
extern int loc;
extern stack<int> locsta;
extern int funcloc;


/* local function and var*/
static int level;                 /* level of syntax tree*/
static void compound_statement(); /* recognise compound_statement,in MiniC every is seen as compound_statement,including declarator and statement*/
static void declarator();         /* recognise declarat,including var,arr,function*/
static void singalDeclarator(NodeType nodeType, const char *name);
static void param_list();         /* recognise param*/
static void checkTokenId();       /* check token is a id or not*/
static void statement();          /* recognise state,like if,while*/
static void if_while_statement(); /* if,while handler*/
static void else_statement();     /* else handler */
static ExpressNode *expression(); /* exp*/
static void showRoot();
static void showSingalNode(void *node);

/* export function and var*/
NodeTree syntaxTree;
void testsyntree();
void program();




/* class realization*/
tree::tree()
{
    root = NULL;
    father = NULL;
    child = NULL;
}
void tree::father_forward()
{
    history.push(father);
    father = child;
}
void tree::father_goback()
{
    father = history.top();
    history.pop();
}

NodeTree::NodeTree()
{
    root = new MultiNode(STMT_ROOT, "root");
    ((MultiNode *)root)->type = STMT_ROOT;
    father = root;
}
void NodeTree::concat()
{
    ((MultiNode *)father)->data.dynarray_add(child);
}
void NodeTree::newChild(NodeType type, const char *name)
{
    switch (type)
    {
    case STMT_FUNCTION:
        child = new FunctionNode(name);
        break;
    case STMT_IF:
        child = new IfNode();
        break;
    case STMT_WHILE:
        child = new WhileNode();
        break;
    case STMT_PARAMS:
    case STMT_ELSE:
    case STMT_STATE:
    case STMT_CALL:
        child = new MultiNode(type, name);
        break;
    case STMT_INT:
    case STMT_ARR:
    case STMT_VOID:
    case STMT_CINT:
        child = new SingalNode(type, name);
        break;
    case STMT_RETURN:
        child = new FunctionReturnNode();
        break;
    default:
        child = new ExpressNode(type, name);
        break;
    }
}

void program()
{
    debug();
    init_compile_callonce();
    while (token != TK_EOF && error != FATALERROR)
    {
        compound_statement();
    }
}

static void compound_statement()
{
    debug();
    getToken();
    /* file end with EOF,  if ,while end with }*/
    if (token == TK_END || token == TK_EOF)
        return;
    if (token == KW_INT || token == KW_VOID)
    {
        declarator();
    }
    else
    {
        statement();
    }
}

static void declarator()
{
    debug();
    NodeType nodeType = STMT_UNKNOW;
    const char *idName;
    const char *returnName[5] = {"", "", "int", "", "void"}; /*STMT_INT=2,STMT_VOID=4 */
    switch (token)
    {
    case KW_VOID:
    case KW_INT:
        if (token == KW_INT)
        {
            nodeType = STMT_INT;
            getToken();
        }
        else
        {
            nodeType = STMT_VOID;
            getToken();
        }
        idName = tkstr.data;
        checkTokenId();
        if (error == FATALERROR)
            goto err;
        /*  int a; int a,b; int a[];int a(),to distinguish between 
            them,need to look faward a token
        */
        getToken();
        if (token == TK_EOF)
        {
            throwError("missing declarator");
            goto err;
        }

        /* if function */
        if (token == TK_OPENPA)
        {
            SingalNode *returnType = new SingalNode(nodeType, returnName[nodeType]);
            syntaxTree.newChild(STMT_FUNCTION, idName);
            syntaxTree.concat();
            syntaxTree.father_forward();
            ((FunctionNode *)syntaxTree.father)->returnType = returnType;

            /* peek param*/
            param_list();
            if (error == FATALERROR)
                goto err;
            if (error == MINORERROR)
                error = NOERROR;
            /* peek function body */
            else
                getToken();
            if (token != TK_BEGIN)
            {
                throwError("expected {");
                error = FATALERROR;
                goto err;
            }
            while (token != TK_END && token != FATALERROR && token != TK_EOF)
                compound_statement();
            syntaxTree.father_goback();
        }
        /* var */
        else
        {
            /* int a; int a,b; int a[] */
            do
            {
                switch (token)
                {
                case TK_SEMICOLON:
                    singalDeclarator(nodeType, idName);
                    break;
                case TK_COMMA: // handler int a,b
                    getToken();
                    singalDeclarator(nodeType, idName);
                    idName = tkstr.data;
                    checkTokenId();

                    getToken();
                    if (token == TK_SEMICOLON)
                        singalDeclarator(nodeType, idName);
                    if (token != TK_COMMA && token != TK_SEMICOLON)
                    {
                        throwError("expectd , or ;");
                        error = FATALERROR;
                    }

                    break;
                case TK_OPENBR: /* int a[1]*/
                    singalDeclarator(nodeType, idName);
                    ((SingalNode *)syntaxTree.child)->type = STMT_ARR;
                    getToken();
                    switch (token)
                    {
                    case TK_CINT: // int a[1
                        ((SingalNode *)syntaxTree.child)->value = tkvalue;
                        getToken();
                        if (token != TK_CLOSEBR)
                            if (token == TK_SEMICOLON)
                            {
                                throwError("expected ]");
                                error = MINORERROR;
                            }
                            else
                            {
                                throwError("arr declarat err");
                                error = FATALERROR;
                            }
                        break;
                    case TK_IDENT: //int a[b
                        ((SingalNode *)syntaxTree.child)->value = -2;
                        ((SingalNode *)syntaxTree.child)->quote = new SingalNode(STMT_INT, tkstr.data, 1);
                        getToken();
                        if (token != TK_CLOSEBR)
                            if (token == TK_SEMICOLON)
                            {
                                throwError("expect ]");
                                error = MINORERROR;
                            }
                            else
                            {
                                throwError("arr declarat err");
                                error = FATALERROR;
                            }
                        break;
                    case TK_CLOSEBR: // int a[]
                        throwError("expected arr init");
                        error = MINORERROR;
                        getToken();
                        break;
                    case TK_SEMICOLON: // int a[;
                        throwError("expected arr init");
                        error = MINORERROR;
                        break;
                    default:
                        throwError("arr declarat err");
                        error = FATALERROR;
                        break;
                    }
                    if (error == FATALERROR)
                        goto err;
                    if (error == MINORERROR)
                    {
                        error = NOERROR;
                    }
                    else
                    {
                        getToken();
                    }
                    if (token != TK_SEMICOLON)
                    {
                        throwError("expected ;");
                        error = FATALERROR;
                        goto err;
                    }
                    break;
                default:
                    throwError("var declarator err");
                    error = FATALERROR;
                    goto err;
                }
            } while (token != TK_SEMICOLON);
        }
    default:
        break;
    }
err:
    return;
}

static void singalDeclarator(NodeType type, const char *name)
{
    syntaxTree.newChild(type, name);
    syntaxTree.concat();
}

static void statement()
{
    debug();
    switch (token)
    {
    case KW_IF:
    case KW_WHILE:
        if_while_statement();
        break;
    case KW_ELSE:
        else_statement();
        break;
    case KW_RETURN:
        syntaxTree.newChild(STMT_RETURN, "return");
        syntaxTree.concat();
        syntaxTree.father_forward();
        getToken();
        //((FunctionReturnNode*)(((MultiNode*)syntaxTree.father)->data.data[0]))->exp = expression();
        syntaxTree.child = (void *)expression();
        syntaxTree.concat();
        syntaxTree.father_goback();
        if (token != TK_SEMICOLON)
            throwError("return expected ;");

        break;
    case KW_BREAK:
        syntaxTree.newChild(STMT_BREAK, "break");
        getToken();
        syntaxTree.concat();
        break;
    default: /* expression handler {x = 1 +1};{func(1)},etc*/
        syntaxTree.child = expression();
        syntaxTree.concat();
        break;
    }
}

static void inline checkTokenId()
{
    if (token != TK_IDENT)
    {
        throwError("id clerical err");
    }
}

static void param_list()
{
    syntaxTree.newChild(STMT_PARAMS, "params");
    ((FunctionNode *)syntaxTree.father)->params = (ParamsNode *)syntaxTree.child;
    syntaxTree.father_forward();

    while (token != TK_CLOSEPA && error != FATALERROR)
    {
        getToken();
        switch (token)
        {
        case KW_VOID:
            throwError("param should not be void");
        case KW_INT:
            getToken();
            checkTokenId();
            if (error == FATALERROR)
                goto err;
            singalDeclarator(STMT_INT, tkstr.data);
            getToken();
            /* int a  ;  int a[]*/
            if (token == TK_OPENBR)
            {
                ((SingalNode *)syntaxTree.child)->type = STMT_ARR;
                getToken();
                switch (token)
                {
                case TK_CINT: // int a[2   ;
                    ((SingalNode *)syntaxTree.child)->value = tkvalue;
                    getToken();
                    if (token != TK_CLOSEBR)
                    {
                        if (token == TK_CLOSEPA || token == TK_COMMA)
                        { // int a[2)  int a[2,  漏了]
                            throwError("expected ]");
                            error = MINORERROR;
                        }
                        else
                        {
                            throwError("arr params clerical err");
                            error = FATALERROR;
                            goto err;
                        }
                    }
                    break;
                case TK_CLOSEBR: // int a[]   ;
                    break;
                case TK_CLOSEPA: // int a[)   ; 漏了]
                    throwError("expected ]");
                    error = MINORERROR;
                    break;
                default:
                    throwError("arr params err");
                    error = FATALERROR;
                    goto err;
                    break;
                }

                if (error != MINORERROR)
                    getToken();
                if (error == MINORERROR)
                    error = NOERROR;
            }
            if (token != TK_COMMA && token != TK_CLOSEPA)
            {
                if (token == TK_BEGIN)
                {
                    throwError("expected ）");
                    error = MINORERROR;
                }
                else
                {
                    throwError("params clerical err");
                    error = FATALERROR;
                    goto err;
                }
            }

            break;
        case TK_CLOSEPA:
            break;
        default:
            error = FATALERROR;
            throwError("params clerical err");
            goto err;
        }
    }
    syntaxTree.father_goback();
    return;
err:
    return;
}

static void if_while_statement()
{
    if (token == KW_IF)
        syntaxTree.newChild(STMT_IF, "if state");
    else
        syntaxTree.newChild(STMT_WHILE, "while state");
    syntaxTree.concat();
    syntaxTree.father_forward();
    getToken();

    if (token != TK_OPENPA)
    {
        throwError("expected (");
    }
    getToken();
    if (token == TK_CLOSEPA)
    {
        throwError("expected exp");
        error = FATALERROR;
        return;
    }
    /* peek exp*/
    if (token == KW_IF)
        ((IfNode *)syntaxTree.father)->exp = expression();
    else
        ((WhileNode *)syntaxTree.father)->exp = expression();
    if (token != TK_BEGIN)
    {
        throwError("expected {");
        error = FATALERROR;
        return;
    }
    /* peek state body*/
    while (token != TK_END && error != FATALERROR)
        compound_statement();

    /*this is err about code logic;now token = },if we do not replace,program will end; */
    token = TK_SEMICOLON;
    syntaxTree.father_goback();
}

static void else_statement()
{
    syntaxTree.newChild(STMT_ELSE, "else");
    syntaxTree.concat();
    syntaxTree.father_forward();
    getToken();
    if (token != TK_BEGIN)
    {
        throwError("expected }");
        error = FATALERROR;
    }

    while (token != TK_END && error != FATALERROR)
        compound_statement();

    /* like if_while_statement*/
    token = TK_SEMICOLON;
    syntaxTree.father_goback();
}

/* generate node using suffix exp
symbol priority(low->high): (  , =  , (<,>,==,>=,<=,!=) ， (+,-)  , (*,/,%) ,   ）
handler situation:
1.if(a +1==2),note this function handler a+1==2)
2.a = a + 1;
3.function call,like func(x)
*/
static ExpressNode *expression()
{
    stack<SingalNode *> sta;
    queue<SingalNode *> suffix;
    SingalNode *op, *pt;
    op = new SingalNode(STMT_UNKNOW, "sta_bottom");
    op->value = -1;
    sta.push(op); /* test stack is empty */

    /*
        {int a},{int a[1]} need look forward;
        so some situation already getToken(); need to judge
    */
    bool shouldGetToken = true;

    while (token != TK_SEMICOLON && token != TK_COMMA)
    {
        op = new SingalNode(STMT_UNKNOW, "exp");
        switch (token)
        {
        case TK_CINT:
            op->type = STMT_CINT;
            op->name = "const";
            op->value = tkvalue;
            suffix.push(op);
            break;
        case TK_OPENPA:
            op->type = STMT_OPENPA;
            op->name = "(";
            op->value = 0;
            sta.push(op);
            break;
        case TK_ASSIGN:
            op->type = STMT_ASSIGN;
            op->name = "=";
            op->value = 1;

            break;
        case TK_PLUS:
            op->type = STMT_PLUS;
            op->name = "+";
            op->value = 3;

            break;
        case TK_MINUS:
            op->type = STMT_MINUS;
            op->name = "-";
            op->value = 3;

            break;
        case TK_STAR:
            op->type = STMT_STAR;
            op->name = "*";
            op->value = 4;

            break;
        case TK_DIVIDE:
            op->type = STMT_DIVIDE;
            op->name = "/";
            op->value = 4;

            break;
        case TK_EQ:
            op->type = STMT_EQ;
            op->name = "==";
            op->value = 2;
            break;
        case TK_NEQ:
            op->type = STMT_NEQ;
            op->name = "!=";
            op->value = 2;

            break;
        case TK_LT:
            op->type = STMT_LT;
            op->name = "<";
            op->value = 2;

            break;
        case TK_LEQ:
            op->type = STMT_LEQ;
            op->name = "<=";
            op->value = 2;

            break;
        case TK_GT:
            op->type = STMT_GT;
            op->name = ">";
            op->value = 2;

            break;
        case TK_GEQ:
            op->type = STMT_GEQ;
            op->name = ">=";
            op->value = 2;

            break;

        case TK_CLOSEPA:
            op->type = STMT_CLOSEPA;
            op->name = ")";
            op->value = 6;
            break;
        default:
            checkTokenId();
            if (error == FATALERROR)
                return NULL;
            op = new SingalNode(STMT_INT, tkstr.data, 1);
            getToken();
            shouldGetToken = false;
            /* arr */
            if (token == TK_OPENBR)
            {
                getToken();
                switch (token)
                {
                case TK_CINT:
                    op->value = tkvalue;
                    op->type = STMT_ARR;
                    getToken();
                    break;
                case TK_IDENT:
                    op->value = -2;
                    op->type = STMT_ARR;
                    op->quote = new SingalNode(STMT_INT, tkstr.data, 1);
                    getToken();
                    break;
                case TK_CLOSEBR:
                    throwError("expected const int");
                    break;
                default:
                    throwError("arr clerical err");
                    error = FATALERROR;
                    return NULL;
                }
                if (token != TK_CLOSEBR)
                {
                    throwError("数组缺少]");
                    error = FATALERROR;
                    return NULL;
                }

                getToken();
            }
            // 如果是a()这种函数调用的问题
            if (token == TK_OPENPA)
            {
                syntaxTree.newChild(STMT_CALL, op->name);
                free(op);
                op = (SingalNode *)syntaxTree.child;
                getToken();
                // token = ),no pramas
                if (token != TK_CLOSEPA)
                {
                    syntaxTree.father_forward();
                    do
                    {
                        if (token == TK_COMMA)
                            getToken();
                        syntaxTree.child = expression();
                        syntaxTree.concat();
                    } while (token == TK_COMMA);
                    syntaxTree.father_goback();
                }
            }
            suffix.push(op);
        }
        if (shouldGetToken)
            getToken();
        else
            shouldGetToken = true;
        /* when op->type =), pop all util (,if reach the bottorm of stack,it is {a==1)}*/
        if (op->type == STMT_CLOSEPA)
        {
            op = sta.top();
            if (op->value == -1)
                break;
            sta.pop();
            while (op->type != STMT_OPENPA)
            {
                suffix.push(op);
                op = sta.top();
                if (op->value == -1)
                    break;
                sta.pop();
            }
            if (op->value == -1)
                break;
        }
        else
        {
            /* if token is {+，-，*，/}  */
            if (op->type > STMT_OPENPA)
            {
                do
                {
                    pt = new ExpressNode(op->type, op->name);
                    pt->value = op->value;
                    free(op);
                    op = pt;
                    pt = sta.top();
                    if (pt->value >= op->value)
                    {
                        suffix.push(pt);
                        sta.pop();
                        pt = sta.top();
                    }
                    else
                    {
                        sta.push(op);
                        break;
                    }
                } while (pt != NULL);
            }
        }
    }
    if (token == TK_SEMICOLON || token == TK_COMMA)
    {
        op = sta.top();
        while (op->value != -1)
        {
            sta.pop();
            suffix.push(op);
            op = sta.top();
        }
    }
    /* when exp is only x*/
    if (suffix.size() == 1)
    {
        op = suffix.front();
        return (ExpressNode *)op;
    }
    SingalNode *right, *left;
    while (!suffix.empty())
    {

        op = suffix.front();
        suffix.pop();
        if (op->type > STMT_OPENPA)
        {
            right = sta.top();

            sta.pop();
            left = sta.top();

            sta.pop();
            ((ExpressNode *)op)->rightOp = right;
            ((ExpressNode *)op)->leftOp = left;
            sta.push(op);
        }
        else
        {
            sta.push(op);
        }
    }
    op = sta.top();

    // #ifndef DEBUGEXP

    //    suffix.push(op);
    //    cout << "表达式" << "=============" << endl;
    //    while (!suffix.empty()) {
    //        pt = suffix.front();
    //        suffix.pop();
    //        if (pt->type != STMT_INT && pt->type != STMT_CINT && pt->type != STMT_ARR&&pt->type!=STMT_CALL) {
    //            cout << ((ExpressNode*)pt)->name << endl;
    //            suffix.push(((ExpressNode*)pt)->leftOp);
    //            cout << pt->name<<":leftOp" << "---------->" << ((ExpressNode*)pt)->leftOp->name << endl;
    //            suffix.push(((ExpressNode*)pt)->rightOp);
    //            cout << pt->name<<":rightOp" << "---------->" << ((ExpressNode*)pt)->rightOp->name << endl;
    //            /*cout << endl << endl;*/
    //        }

    //    }
    // #endif
    return (ExpressNode *)op;
}

static void inline display(void *node)
{
    for (int i = 0; i < level - 1; i++)
    {
        cout << '\t';
    }

    cout << "|--->" << SNODE(node)->name << endl;
}
/*recursive invocation this function to show a syntaxTree*/
static void showSingalNode(void *node)
{
    int count = 0;
    switch (SNODE(node)->type)
    {
    case STMT_ROOT:
        level++;
        display(node);
        while (MNODE(node)->data.count > count)
        {
            showSingalNode(MNODE(node)->data.data[count]);
            count++;
        }
        level--;
        break;

    case STMT_FUNCTION:

        sym_insert(SNODE(node),funcloc++,1);
        level++;
        display(node);
        locsta.push(loc);
        loc = 0;
        
        if (FNODE(node)->params != NULL)
        {
            level++;
            showSingalNode(FNODE(node)->params);
            level--;
        }

        while (FNODE(node)->data.count > count)
        {
            showSingalNode(FNODE(node)->data.data[count]);
            count++;
        }
        FNODE(node)->value = loc;  // 保存函数局部变量地址
        loc = locsta.top();
        locsta.pop();

        level--;
        sym_delete(level);

        break;
    case STMT_RETURN:
        display(node);
        level++;
        showSingalNode(((FunctionReturnNode *)node)->data.data[0]);
        level--;
        break;
    case STMT_PARAMS:
        display(node);
        level++;
        while (MNODE(node)->data.count > count)
        {
            showSingalNode(MNODE(node)->data.data[count]);
            count++;
        }
        level--;
        break;
    case STMT_IF:
        level++;
        locsta.push(loc);
        loc = 0;
        display(node);
        level++;
        if (IFNODE(node)->exp != NULL)
            showSingalNode(IFNODE(node)->exp);

        while (IFNODE(node)->data.count > count)
        {
            showSingalNode(IFNODE(node)->data.data[count]);
            count++;
        }
        level--;
        level--;
        sym_delete(level);
        loc = locsta.top();
        locsta.pop();
        break;
    case STMT_ELSE:
        level++;
        locsta.push(loc);
        loc = 0;
        display(node);
        level++;
        while (MNODE(node)->data.count > count)
        {
            showSingalNode(MNODE(node)->data.data[count]);
            count++;
        }
        level--;
        level--;
        sym_delete(level);
        loc = locsta.top();
        locsta.pop();
        break;
    case STMT_WHILE:
        level++;
        locsta.push(loc);
        loc = 0;
        display(node);
        level++;
        if (WNODE(node)->exp != NULL)
            showSingalNode(WNODE(node)->exp);
        while (WNODE(node)->data.count > count)
        {
            showSingalNode(WNODE(node)->data.data[count]);
            count++;
        }
        level--;
        level--;
        sym_delete(level);
        loc = locsta.top();
        locsta.pop();
        break;
    case STMT_CALL:
        sym_lookup(SNODE(node));
        display(node);
        level++;
        while (MNODE(node)->data.count > count)
        {
            showSingalNode(((MultiNode *)node)->data.data[count]);
            count++;
        }
        level--;
        break;
    case STMT_UNKNOW: /*unlikely*/

        break;
    case STMT_VOID:
        display(node);
        break;
    case STMT_INT:
         SNODE(node)->global = level;
         if(SNODE(node)->defineFlag == 0)
               sym_insert(SNODE(node),loc++,level);
          else
               sym_lookup(SNODE(node));
        display(node);
        break;
    case STMT_ARR:
        SNODE(node)->global = level;
        if((SNODE(node))->defineFlag == 0){
            loc += (SNODE(node))->value;
             sym_insert(SNODE(node),loc++,level);
        }
        else
            sym_lookup(SNODE(node));

        display(node);

        if (SNODE(node)->value == -2)
        {
            level++;
            showSingalNode(SNODE(node)->quote);
            level--;
        }
        break;
    case STMT_CINT:
        SNODE(node)->global = level;
        for (int i = 0; i < level - 1; i++)
            cout << "\t";
        cout << "|--->" << SNODE(node)->value;
        cout << endl;
        break;
    default:
        SNODE(node)->global = level;
        display(node);
        if (ENODE(node)->leftOp != NULL)
        {
            level++;
            showSingalNode(ENODE(node)->leftOp);
            level--;
        }
        if (((ExpressNode *)node)->rightOp != NULL)
        {
            level++;
            showSingalNode(ENODE(node)->rightOp);
            level--;
        }
        break;
    }
}

static void showRoot()
{
    debug();
    showSingalNode(syntaxTree.root);
}

void testSyntree()
{
    debug();
    program();
    if (error != FATALERROR)
        showRoot();
}