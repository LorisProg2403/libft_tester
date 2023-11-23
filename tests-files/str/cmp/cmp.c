#include "../../../../include/libft.h"
#include <string.h>

int main(int ac, char **av)
{
	if (ac == 3)
	{
		if (strcmp(av[1],av[2]) == ft_strcmp(av[1],av[2]))
			ft_printf("OK\n");
		else
			ft_printf("KO\n");
	}
	else
		ft_printf("KO\n");
}
