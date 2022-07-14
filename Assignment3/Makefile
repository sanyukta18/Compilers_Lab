output.txt: a.out ass3_19CS30016_test.c
	./a.out < ass3_19CS30016_test.c > output.txt

a.out: lex.yy.c
	gcc ass3_19CS30016.c -lfl
	
lex.yy.c: ass3_19CS30016.l
	lex ass3_19CS30016.l

clean:
	rm output.txt a.out lex.yy.c
