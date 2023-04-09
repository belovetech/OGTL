.PHONY: all clean oclean fclean re

CC = gcc
SRC = my_spaceship.c
OBJ = $(SRC:%.c=%.o)
NAME = my_spaceship
RM = rm -f
CFLAGS = -Wall -Wextra -Werror

all: $(OBJ)
	$(CC) $(SRC) -o $(NAME)

clean:
	$(RM) *~ $(NAME)

oclean:
	$(RM) $(OBJ)

fclean: clean oclean

re: fclean all