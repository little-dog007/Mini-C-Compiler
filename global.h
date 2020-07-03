/*  this file should be include by all file*/


#pragma once

#include<iostream>
#include<fstream>
#include<string.h>

#include<stdlib.h>
#include<iostream>
#include"debug.h"
using namespace std;


/*handler err*/
extern int line_num;
#define throwError(s)  cout<<line_num<<":"<<s<<endl;

enum E_ErrorType{
    NOERROR,    /* no err*/
    MINORERROR, /* warn */
    FATALERROR, /* fatal,we have to leave compile*/

};

extern E_ErrorType error;





