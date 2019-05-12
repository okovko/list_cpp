.RECIPEPREFIX= 
.PHONY: re all clean fclean

NAME = list.a
SRCS = $(wildcard srcs/%.c)
BINS = $(patsubst srcs/%.c, %.o, $(SRCS))
FLAGS = -g -Wall -Wextra -Werror -Wconversion

%.o: srcs/%.c
  gcc $(FLAGS) -Iincs -c %<

all: $(NAME)

$(NAME): $(BINS)
  ar rc $(NAME) $(BINS)
  ranlib $(NAME)

clean:
  /bin/rm -f $(BINS)

fclean: clean
  /bin/rm -f $(NAME)

re: fclean all
