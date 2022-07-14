
 
a.out: lex.yy.o y.tab.o asgn4_19CS30016.o
	gcc lex.yy.o y.tab.o asgn4_19CS30016.o -lfl

lex.yy.c: asgn4_19CS30016.l y.tab.h
		flex asgn4_19CS30016.l

y.tab.c: asgn4_19CS30016.y
			yacc -dtv asgn4_19CS30016.y -W

asgn4_19CS30016.o: asgn4_19CS30016.c
	gcc -c asgn4_19CS30016.c

y.tab.h: asgn4_19CS30016.y
		yacc -dtv asgn4_19CS30016.y -W

lex.yy.o: lex.yy.c
	gcc -c lex.yy.c

y.tab.o: y.tab.c
	gcc -c y.tab.c

clean:
	rm lex.yy.c y.tab.c y.tab.h lex.yy.o y.tab.o asgn4_19CS30016_main.o y.output a.out

test:
	./a.out < asgn4_19CS30016_test.c