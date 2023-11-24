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
		ft_striteri(str, iti_test);
		if (!strcmp(str, "aCeGiK"))
			ft_printf("OK\n");
		else
			ft_printf("KO\n");
	}
	else if (ac == 3)
	{
		(void)av;
		char	str[] = "aaaaaa";
		ft_striteri(str, iti_test);
		if (!strcmp(str, "abcdef"))
			ft_printf("OK\n");
		else
			ft_printf("KO\n");
	}
	else if (ac == 4)
	{
		(void)av;
		char	str[] = "Helloo";
		ft_striteri(str, iti_test);
		if (!strcmp(str, "Hfnost"))
			ft_printf("OK\n");
		else
			ft_printf("KO\n");
	}
	else if (ac == 5)
	{
		(void)av;
		char	str[] = "1234";
		ft_striteri(str, iti_test);
		if (!strcmp(str, "1357"))
			ft_printf("OK\n");
		else
			ft_printf("KO\n");
	}
	else
	{
		(void)av;
		char	str[] = "aBcDeF";
		ft_striteri(str, iti_test);
		if (!strcmp(str, "aCeGiK"))
			ft_printf("OK\n");
		else
			ft_printf("KO\n");
	}
}
