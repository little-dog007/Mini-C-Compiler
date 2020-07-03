/*A program to perform*/

int x[3];

/*find the smallest num*/
int minloc(int low, int high) {
	int i, a, k;
	k = low;
	a = x[low];
	i = low + 1;
	while (i < high) {
		if (x[i] < a) {
			a = x[i];
			k = i;
		}
		i = i + 1;
	}
	return k;
}
/* a ,b is the begin and end index*/
void sort(int low,int high){
	int i, k,t;
	i = low;
	output(x[0]);
	output(x[1]);
	output(x[2]);
	while (i < high - 1) {
		k = minloc(i, high);
		t = x[k];
		x[k] = x[i];
		x[i] = t;
		i = i + 1;
	}
}
void main() {
	int i;
	i = 0;

	while (i < 5) {
		input(x[i]);
		i = i + 1;
	}

	
	sort(0,5);
	i = 0;
	while (i < 5) {
		output(x[i]);
		i = i + 1;
	}

	
	
	
}