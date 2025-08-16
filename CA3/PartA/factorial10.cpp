int main() {
    int n=10;
    int factorial = 1;
	int* result = (int*) 0x00100100;


        for (int i = 1; i <= n; ++i) {
            factorial *= i;
        }
		
		* result = factorial;
     

    return 0;
}