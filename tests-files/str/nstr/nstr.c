#include "../../../../include/libft.h"
#include <string.h>

int main(int ac, char **av)
{
	if (ac == 2)
	{
		char	buf[10];

		bzero(buf, 10);
		strcpy(buf, "un deux 9");
		if (!strnstr(buf, "deux", 10) && !ft_strnstr(buf, "deux", 10))
			ft_printf("OK\n");
		else if (!strnstr(buf, "deux", 10) || !ft_strnstr(buf, "deux", 10))
			ft_printf("KO\n");
		else if (!strcmp(strnstr(buf, "deux", 10), ft_strnstr(buf, "deux", 10)))
			ft_printf("OK\n");
		else
			ft_printf("KO\n");
	}
	else if (ac == 3)
	{
		char	buf[10];

		bzero(buf, 10);
		strcpy(buf, "un deux 9");
		if (!strnstr(buf, "9", 3) && !ft_strnstr(buf, "9", 3))
			ft_printf("OK\n");
		else if (!strnstr(buf, "9", 3) || !ft_strnstr(buf, "9", 3))
			ft_printf("KO\n");
		else if (!strcmp(strnstr(buf, "9", 3), ft_strnstr(buf, "9", 3)))
			ft_printf("OK\n");
		else
			ft_printf("KO\n");
	}
	else if (ac == 4)
	{
		char	buf[10];

		bzero(buf, 10);
		strcpy(buf, "un deux 9");
		if (!strnstr(buf, "", 6) && !ft_strnstr(buf, "", 6))
			ft_printf("OK\n");
		else if (!strnstr(buf, "", 6) || !ft_strnstr(buf, "", 6))
			ft_printf("KO\n");
		else if (!strcmp(strnstr(buf, "", 6), ft_strnstr(buf, "", 6)))
			ft_printf("OK\n");
		else
			ft_printf("KO\n");
	}
	else if (ac == 5)
	{
		char	buf[10];

		bzero(buf, 10);
		strcpy(buf, "un deux 9");
		if (!strnstr(buf, "deux", 5) && !ft_strnstr(buf, "deux", 5))
			ft_printf("OK\n");
		else if (!strnstr(buf, "deux", 5) || !ft_strnstr(buf, "deux", 5))
			ft_printf("KO\n");
		else if (!strcmp(strnstr(buf, "deux", 5), ft_strnstr(buf, "deux", 5)))
			ft_printf("OK\n");
		else
			ft_printf("KO\n");
	}
	else
	{
		char	buf[10];

		bzero(buf, 10);
		strcpy(buf, "un deux 9");
		if (!strnstr(buf, "9", 10) && !ft_strnstr(buf, "9", 10))
			ft_printf("OK\n");
		else if (!strnstr(buf, "9", 10) || !ft_strnstr(buf, "9", 10))
			ft_printf("KO\n");
		else if (!strcmp(strnstr(buf, "9", 10), ft_strnstr(buf, "9", 10)))
			ft_printf("OK\n");
		else
			ft_printf("KO\n");
	}
}
