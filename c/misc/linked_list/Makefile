## A simple makefile

##CC = gcc
CC = clang
CFLAGS = -g -Wall

PROG = program
HDRS = node.h
SRCS = main.c buildOneTwoThree.c length.c push.c BuildWithLocalRef.c count.c getNth.c deletelist.c pop.c insertnth.c

## This incantation says that the object files
## have the same name as the .c files, but with .o
OBJS = $(SRCS:.c=.o)

## This is the first rule (the default)
## Build the program from the above .o's
$(PROG) : $(OBJS)
	$(CC) $(OBJS) -o $(PROG)

## Rules for the source files 

main.o : main.c node.h
	$(CC) $(CFLAGS) -c main.c
