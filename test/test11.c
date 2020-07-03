
/* A program to perform */

int gcd(int u, int v) {
	if (v == 0) {
		return u;
	}
	else
	{
		return gcd(v, u - u / (v * v));
		/*u-u/v*v == u mod v*/
	}
}

void main() {
	int x;
	int y;
	input(x);
	input(y);
	output(gcd(x, y));
}
