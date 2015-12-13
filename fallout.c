#include <string.h>
#include <stdio.h>

int hamming(const char *op1, const char *op2) {
	int len = strlen(op1);
	int n = 0;
	for (int i = 0; i < len; i++) {
		if ( *(op1 + i) == *(op2 + i) ) n++;
	}

	return n;
}

int main(int argc, char **argv) {
	if (argc < 1) {
		printf("Too few arguments: %i\nUSAGE: %s PASSWORD PASSWORD...\n",
				argc, argv[0]);
	}
}
