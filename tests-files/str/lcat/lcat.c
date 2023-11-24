#include "../../../../include/libft.h"
#include <string.h>

int main(int ac, char **av)
{
	if (ac == 4)
	{
		int	ft;
		int	str;
		char *dst;
		char *src;
		char *ft_dst;
		char *ft_src;

		dst = malloc(sizeof(char) * 25);
		ft_dst = malloc(sizeof(char) * 25);
		int i = 0;
		while (av[1][i])
		{
			dst[i] = av[1][i];
			ft_dst[i] = av[1][i];
			i++;
		}
		dst[i] = '\0';
		ft_dst[i]= '\0';

		src = av[2];
		ft_src = av[2];

		str = strlcat(dst, src, (size_t)ft_atoi(av[3]));
		ft = ft_strlcat(ft_dst, ft_src, (size_t)ft_atoi(av[3]));

		if (ft != str || strcmp(dst, ft_dst))
			ft_printf("KO\n");
		else
			ft_printf("OK\n");
		free(dst);
		free(ft_dst);
	}
	else
		ft_printf("KO\n");
}
