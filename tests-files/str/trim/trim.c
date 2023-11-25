#include "../../../../include/libft.h"
#include <string.h>

int main(int ac, char **av)
{
	if (ac == 4)
	{
		char *out;

		out = ft_strtrim(av[1], av[2]);
		if (!out)
			return (1);
		if (!strcmp(out, av[3]))
			ft_printf("OK\n");
		else
			ft_printf("KO\n");
		free(out);
	}
	else
		ft_printf("KO\n");
}
