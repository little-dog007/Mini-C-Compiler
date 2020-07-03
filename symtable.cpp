#include "global.h"
#include "symtable.h"

/*export function and var*/
int loc = 0; /* address of var*/
stack<int> locsta;
int funcloc = 0;

/*local var*/
static sym *hashTable[SIZE];
int symhash(const char *name)
{
    symtable_cout();
    int key = 0;
    int i = 0;
    while (name[i] != '\0')
    {
        key = ((key << SHIFT) + name[i]) % SIZE;
        ++i;
    }
    return key;
}

void sym_insert(SingalNode *node, int loc, int level)
{
    symtable_cout();
    int key = symhash(node->name);
    sym *symbal = hashTable[key];

    while ((symbal != NULL) && ((strcmp(node->name, symbal->sym_node->name) != 0) || (symbal->sym_level != level)))
    {
        /*in this program,symtable only used to ensure semantic correctsness,so we can delete 
           symbals which we never use again;
        */
        if (level < symbal->sym_level)
        {
            sym_pop(key, symbal);
            symbal = hashTable[key];
            continue;
        }
        symbal = symbal->sym_next;
    }
    if (symbal == NULL)
    {
        symbal = new sym(node, level);
        symbal->sym_node->memloc = loc;
        sym_push(key, symbal);
    }
    else
    {
        throwError("var multi declarte");
    }
}

void sym_delete(int lev)
{
    symtable_cout();
    sym *p;
    for (int i = 0; i < SIZE; i++)
    {
        if (hashTable[i] != NULL)
            while (hashTable[i]->sym_level > lev)
            {
                p = hashTable[i];
                hashTable[i] = p->sym_next;
                free(p);
                if (hashTable[i] == NULL)
                    break;
            }
    }
}

void sym_pop(int key, sym *symbal)
{
    symtable_cout();
    hashTable[key] = symbal->sym_next;
    free(symbal);
}

void sym_push(int key, sym *symbal)
{
    symtable_cout();
    sym *p = hashTable[key];
    hashTable[key] = symbal;
    symbal->sym_next = p;
}

void sym_lookup(SingalNode *node)
{
    symtable_cout();
    int key = symhash(node->name);
    sym *symbal = hashTable[key];
    while ((symbal != NULL) && (strcmp(node->name, symbal->sym_node->name) != 0))
    {
        symbal = symbal->sym_next;
    }
    if (symbal == NULL)
    {
        throwError("undefine var");
        return;
    }
    else
    {
        if (node->type != STMT_CALL && node->type != symbal->sym_node->type)
        {
            node->type = symbal->sym_node->type;
        }

        node->memloc = symbal->sym_node->memloc;
    }
}
