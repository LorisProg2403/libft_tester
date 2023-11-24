#include "../../../../include/libft.h"
#include <string.h>

int main(int ac, char **av)
{
	if (ac == 3)
	{
		int	ft;
		int	str;
		char dst[25];
		const char *src;
		char ft_dst[25];
		const char *ft_src;

		int i = 0;
		while (av[1][i])
		{
			dst[i] = av[1][i];
			ft_dst[i] = av[1][i];
			i++;
		}
		src = av[2];
		ft_src = av[2];

		str = strlcat(dst, src, sizeof(dst));
		ft = ft_strlcat(ft_dst, ft_src, sizeof(ft_dst));

		if (ft != str || strcmp(dst, ft_dst))
			ft_printf("KO\n");
		else
			ft_printf("OK\n");
	}
	else
		ft_printf("KO\n");
}
