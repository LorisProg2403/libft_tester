#include "../../../../include/libft.h"
#include <string.h>

int main(int ac, char **av)
{
	if (ac == 2)
	{
		char	*out;
		out = ft_strdup(av[1]);
		if (!strcmp(av[1], out))
			ft_printf("OK\n");
		else
			ft_printf("KO\n");
		free(out);
	}
	else
		ft_printf("KO\n");
}
