#include "../../../../include/libft.h"


int main(int ac, char **av)
{
	if (ac == 3)
	{
		if (ft_strlen(av[1]) != ft_atoi(av[2]))
			ft_printf("KO\n");
		else
			ft_printf("OK\n");
	}
	else
		ft_printf("KO\n");
}
