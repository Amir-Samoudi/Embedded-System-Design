//#include <iostream>

int main() {
    int n=10;
    int factorial = 1.0;
	int* result = (int*) 0x0003E8;


        for (int i = 1; i <= n; ++i) {
            factorial *= i;
        }
		
		* result = factorial;
     

    return 0;
}