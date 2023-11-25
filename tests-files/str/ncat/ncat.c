#include "../../../../include/libft.h"
#include <string.h>

int main(int ac, char **av)
{
	if (ac == 4)
	{
		char dst[25];
		char ft_dst[25];

		int i = 0;
		while (av[1][i])
		{
			dst[i] = av[1][i];
			ft_dst[i] = av[1][i];
			i++;
		}
		dst[i] = '\0';
		ft_dst[i] = '\0';

		const char *src = av[2];
		const char *ft_src = av[2];

		strncat(dst, src, (size_t)ft_atoi(av[3]));
		ft_strncat(ft_dst, ft_src, (size_t)ft_atoi(av[3]));

		if (!strcmp(dst, ft_dst))
			ft_printf("OK\n");
		else
			ft_printf("KO\n");
	}
	else
		ft_printf("KO\n");
}
