#include "../../../../include/libft.h"
#include <string.h>

void	iti_test(char *c)
{
	*c = *c + 1;
}

int main(int ac, char **av)
{
	if (ac == 2)
	{
		(void)av;
		char	str[] = "aBcDeF";
		str = ft_striteri(str, iti_test);
		if (!strcmp(str, "bcdef"))
			ft_printf("OK\n");
		else
			ft_printf("KO\n");
	}
	else
	{
		(void)av;
		char	str[] = "aBcDeF";
		str = ft_striteri(str, iti_test);
		if (!strcmp(str, "bcdef"))
			ft_printf("OK\n");
		else
			ft_printf("KO\n");
	}
}
