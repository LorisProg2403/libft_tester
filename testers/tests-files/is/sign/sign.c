#include "../../../../include/libft.h"
#include <ctype.h>

int main(int ac, char **av)
{
	if (ac == 2)
	{
		if (ft_atoi(av[1]) == '+' || ft_atoi(av[1]) == '-')
			if (ft_issign(ft_atoi(av[1])))
				printf("OK\n");
			else
				printf("KO\n");
		else
			if (!ft_issign(ft_atoi(av[1])))
				printf("OK\n");
			else
				printf("KO\n");
	}
	else
		ft_printf("KO\n");
}
