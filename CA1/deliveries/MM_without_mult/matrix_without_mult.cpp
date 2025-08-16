int mult(int a, int b)
{
    int s = 0;
    for(int i = 0; i < b; i++)
    {
        s += a;
    }
    return s;
}


int main() {
    int* A = (int*) 0x100000;
    int* B = (int*) 0x100020;
    int* C = (int*) 0x100040;

    A[0] = 2;
    A[1] = 5;
    A[2] = 3;
    A[3] = 2;

    B[0] = 3;
    B[1] = 1;
    B[2] = 7;
    B[3] = 4;

    for (int i = 0; i < 2; i++) {
        for (int j = 0; j < 2; j++) {
            C[(i << 1) + j] = 0; 
            for (int k = 0; k < 2; k++) {
                C[(i << 1) + j] += mult(A[(i << 1) + k], B[(k << 1) + j]);
            }
        }
    }
    return 0;
}
