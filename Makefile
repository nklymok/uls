.PHONY: all clean install uninstall

NAME = uls

SRCD = src
INCD = inc
OBJD = obj
LIBD = libmx

CC = clang                                        #_
CFLAGS = -std=c11 -Wall -Wextra -Werror -Wpedantic# -g3 -O0 -fno-omit-frame-pointer -fsanitize=address,undefined
MV = mv
MK = mkdir -p
RM = rm -rf

SRC = $(wildcard $(SRCD)/*.c)
INC = $(wildcard $(INCD)/*.h)
OBJ = $(addprefix $(OBJD)/, $(notdir $(SRC:%.c=%.o)))
LIB = libmx.a

all:    $(NAME)

$(NAME):        $(OBJ) $(LIB)
	@$(CC) $(CFLAGS) -o $(NAME) $(OBJ) -L. $(LIBD)/$(LIB)

$(OBJ): |       $(OBJD)

$(LIB):
	@$(MAKE) -sC $(LIBD)

$(OBJD)/%.o: $(SRCD)/%.c $(INC)
	@$(CC) $(CFLAGS) -c $< -o $@ -I $(INCD)

$(OBJD):
	@$(MK) $@

clean:
	@$(RM) $(OBJD)
	@$(MAKE) clean -sC $(LIBD)

uninstall: clean
		@$(RM) $(NAME)
		@$(MAKE) uninstall -sC $(LIBD)

reinstall: uninstall all
