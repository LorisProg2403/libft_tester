#include "../../../../include/libft.h"
#include <string.h>

int main(int ac, char **av)
{
	if (ac == 3)
	{
		if (!strrchr(av[1],av[2][0]) && !ft_strrchr(av[1],av[2][0]))
			ft_printf("OK\n");
		else if ((strrchr(av[1],av[2][0]) && !ft_strrchr(av[1],av[2][0])) || (!strrchr(av[1],av[2][0]) && ft_strrchr(av[1],av[2][0])))
			ft_printf("KO\n");
		else if (!strcmp(strchr(av[1],av[2][0]),ft_strrchr(av[1],av[2][0])))
			ft_printf("OK\n");
		else
			ft_printf("KO\n");
	}
	else
		ft_printf("KO\n");
}
