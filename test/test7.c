int x;
int test(int x,int y){
return x+y;
}
void main(){
/*test return value of global var*/
x = test(1,2);
output(x);

/*test return value of local var*/
int y;
input(y);
int z;
input(z);
int x;
x = test(y,z);
output(x);
}