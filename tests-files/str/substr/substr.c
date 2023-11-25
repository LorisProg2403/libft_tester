#include "../../../../include/libft.h"
#include <string.h>
#include <stdlib.h>

int main(int ac, char **av)
{
	if (ac == 5)
	{
		char *out;

		out = ft_substr(av[1], atoi(av[2]), atoi(av[3]));
		if (!strcmp(out, av[4]))
			ft_printf("OK\n");
		else
			ft_printf("KO\n");
	}
	else
		ft_printf("KO\n");
}
