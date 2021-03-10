#include <stdio.h>

int main(int argc, char **argv) {
        printf("[%d] bash shim start\n", getpid());
        printf(" argv[0] = %s, argv[1] = %s\n", argv[0], argv[1]);
        
}
