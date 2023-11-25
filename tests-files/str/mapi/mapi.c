#include "../../../../include/libft.h"
#include <string.h>

char	mapi_test(unsigned int i, char c)
{
	return (c + i);
}

int main(int ac, char **av)
{
	if (ac == 2)
	{
		char	*str;

		str = "abcde";
		str = ft_strmapi(str, mapi_test);
		if (!strcmp(str, "acegi"))
			ft_printf("OK\n");
		else
			ft_printf("KO\n");
	}
	else if (ac == 3)
	{
		char	*str;

		str = "aaaaaa";
		str = ft_strmapi(str, mapi_test);
		if (!strcmp(str, "abcdef"))
			ft_printf("OK\n");
		else
			ft_printf("KO\n");
	}
	else if (ac == 4)
	{
		char	*str;

		str = "Helloo";
		str = ft_strmapi(str, mapi_test);
		if (!strcmp(str, "Hfnost"))
			ft_printf("OK\n");
		else
			ft_printf("KO\n");
	}
	else
	{
		char	*str;

		str = "1234";
		str = ft_strmapi(str, mapi_test);
		if (!strcmp(str, "1357"))
			ft_printf("OK\n");
		else
			ft_printf("KO\n");
	}
}
