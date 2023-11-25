#include "../../../../include/libft.h"
#include <string.h>
#include <stdlib.h>

int main(int ac, char **av)
{
	if (ac == 2)
	{
		char *ft_str;

		ft_str = ft_strnew(atoi(av[1]));
		if (!ft_str && atoi(av[1]))
		{
			ft_printf("KO\n");
		}
		else
			ft_printf("OK\n");
		free(ft_str);
	}
	else
		ft_printf("KO\n");
}
