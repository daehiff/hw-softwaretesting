#include <stdio.h>
#include <klee/klee.h>

int is_prime(int n) {
	if(n <= 1) {
		return 0;}
		
	for(int i = 2; i <= n / 2; i++) {
        if((n % i) == 0) {
            return 0;
        }
    }
    return 1;
}


int fun(int a, int b) {
    int x = a-b;
    int y = a+b+3;
    if (a%2 == 0) {
        a = b++;
        if (y > 0) {
            x = y-2;
        }
    }
    if (a+6 >x) {
        b = 5;
    }
    return y + a+b;
}


int main() {
    int a, b ;
      
    klee_make_symbolic(&a, sizeof(a), "a");
    klee_make_symbolic(&b, sizeof(b), "b");
    fun(a, b);
    return 0;
}