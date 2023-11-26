NAME = char
CC = gcc
LIBFT = ../../../../libft.a
INCS = ../../../../include/

SRC = char.c



all : 		$(NAME)




$(NAME) :
			@$(CC) $(SRC) $(LIBFT) -o $(NAME)
			@$(CC) print.c -o print

fclean :
			@rm -rf $(NAME)
			@rm -rf print
			@rm -rf $(OBJ)

.PHONY :	fclean all
