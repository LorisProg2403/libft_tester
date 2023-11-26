#include <stdio.h>

int main(int ac, char **av)
{
	if (ac == 1)
		printf("The char 'a' : %c\n", 'a');
	else if (ac == 2)
		printf("The char 'a' : %c\n", 'b');
	else if (ac == 3)
		printf("The char 'a' : %c\n", 'a');
}
