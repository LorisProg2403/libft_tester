#include "../../../../include/libft.h"
#include <string.h>

int main(int ac, char **av)
{
	if (ac == 4)
	{
		if (ft_strncmp(av[1],av[2],(size_t)ft_atoi(av[3])) == strncmp(av[1],av[2],(size_t)ft_atoi(av[3])))
			ft_printf("OK\n");
		else
			ft_printf("KO\n");
	}
	else
		ft_printf("KO\n");
}
