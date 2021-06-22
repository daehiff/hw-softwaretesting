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



int main() {
    int b;
      
    klee_make_symbolic(&b, sizeof(b), "b");
    is_prime(b);
    return 0;
}
