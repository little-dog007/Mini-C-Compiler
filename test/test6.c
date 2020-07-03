/*test global var*/
int global;

/*test func of 0 param*/
void test(){
output(global);
}

/*test func of 1 param*/
void test1(int x){
global = global + x;
output(global);
}

/*test func of 2 param*/
void test2(int x,int y){
int z;
z = x+y;
output(z);
}
void main(){
global = 100;
/*test arr*/
int arr[3];
arr[0] = 1;
arr[1] = 2;
arr[2] = 3;
test();
test1(arr[0]);
test();
test2(arr[1],arr[2]);

}