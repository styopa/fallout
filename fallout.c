#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

int inarray(const char **array, int num, const char *string) {
	for (int i = 0; i < num; i++) {
		if (!strcmp(string, array[i])) {
			return 1;
		}
	}
	return 0;
}

void strtolower(char *ch) {
	for (; *ch; ch++) *ch = tolower(*ch);
}

int hamming(const char *op1, const char *op2) {
	int len = strlen(op1);
	int n = 0;
	for (int i = 0; i < len; i++) {
		if ( *(op1 + i) == *(op2 + i) ) n++;
	}

	return n;
}

int main(int argc, char **argv) {
	int i;
	int n_passw = argc - 1;

	if (n_passw < 2) {
		fprintf(stderr, "Too few arguments: %i\nUSAGE: %s PASSWORD PASSWORD...\n",
				n_passw, argv[0]);
		return 1;
	}

	char **passwords = &argv[1];
	int len = strlen(passwords[0]);
	for (i = 1; i < n_passw; i++) {
		if (strlen(passwords[i]) != len) {
			fprintf(stderr, "Passwords are of different length: '%s' and '%s'\n",
					passwords[0], passwords[i]);
			return 2;
		}
	}

	for (i = 0; i < n_passw; i++) strtolower(passwords[i]);

	char *input;
	int correct;
	for (i = 0; i < n_passw; i++) {
		printf("%s", "Enter password and number of correct letters\n> ");
		if ( scanf("%ms %i", &input, &correct) != 2 ) return 0;
		strtolower(input);
		if (!inarray((const char **) passwords, n_passw, input)) {
			fprintf(stderr, "%s is not in the list of possible passwords\n", input);
			return 3;
		}

		free(input);
	}
}
