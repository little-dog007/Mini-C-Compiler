int test(int x,int y){
return x+y;
}

void main(){
output(test(2,2));
int x;
x = test(1,test(1,2));
output(x);
}