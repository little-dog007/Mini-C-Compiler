/* for debugging */

#pragma once

#define DEBUG 1

#ifdef DEBUG
#define cout(c,s) cout<<__FILE__<<"  "<<__FUNCTION__<<"  "<<__LINE__ <<"  "<<c<<":"<<s<<endl;  
#define debug()  cout<<"<----------" << __FUNCTION__<<endl;
#else
    #define cout(c,s)  /*do nothing */
    #define debug()  /*do nothing*/
#endif

#define SYMTABLE 0

#ifdef SYMTABLE
#define symtable_cout() cout<<"<----------" << __FUNCTION__<<endl; 
#else
#define symtable_cout /*do nothing*/
#endif
