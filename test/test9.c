/*test many if else*/
int x;
void main(){
  input(x);
  while(x !=0){
	if(x > 10){
	     if(x == 11){
	        output(11);
	     }else{
		output(22);
	     }
	}else{
	     if(x == 5){
		output(5);
	     }else{
		output(6);
             }
	}
	input(x);
  }
}