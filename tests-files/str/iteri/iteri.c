#include "../../../../include/libft.h"
#include <string.h>

void	iti_test(unsigned int i, char *c)
{
	*c = *c + i;
}


int main(int ac, char **av)
{
	if (ac == 2)
	{
		(void)av;
		char	str[] = "aBcDeF";
		char	*out;
		out = malloc(sizeof(char) * 8);
		if (!out)
			return (1);
		out = ft_striteri(str, iti_test);
		if (!strcmp(out, "aCeGiK"))
			ft_printf("OK\n");
		else
			ft_printf("KO\n");
		free(out);
	}
	else
	{
		(void)av;
		char	str[] = "aBcDeF";
		char	*out;
		out = malloc(sizeof(char) * 8);
		if (!out)
			return (1);
		out = ft_striteri(out, iti_test);
		if (!strcmp(str, "aCeGiK"))
			ft_printf("OK\n");
		else
			ft_printf("KO\n");
		free(out);
	}
}
