all: part1

part1: part1.c 
	gcc -ll part1.c -o part1

part1.c: part1.lex
	flex part1.lex

clean:
	rm -f part1 part1.c
