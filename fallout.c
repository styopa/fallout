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
	if (argc < 3) {
		printf("Too few arguments: %i\nUSAGE: %s PASSWORD PASSWORD...\n",
				argc - 1, argv[0]);
		return 1;
	}

	int len = strlen(argv[1]);
	for (int i = 2; i < argc; i++) {
		if (strlen(argv[i]) != len) {
			printf("Passwords are of different length: '%s' and '%s'\n",
					argv[1], argv[i]);
			return 2;
		}
	}
}
