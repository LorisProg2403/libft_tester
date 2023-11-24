#include "../../../../include/libft.h"
#include <string.h>

void	iti_test(unsigned int i, char *c)
{
	*c = *c + i;
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
