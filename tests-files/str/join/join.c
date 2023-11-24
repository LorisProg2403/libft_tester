#include "../../../../include/libft.h"
#include <string.h>

int main(int ac, char **av)
{
	if (ac == 4)
	{
		char out = ft_strjoin(av[1], av[2]);
		if (!strcmp(av[3], out))
			ft_printf("OK\n")
		else
			ft_printf("KO\n");
		free(out);
	}
	else
		ft_printf("KO\n");
}
