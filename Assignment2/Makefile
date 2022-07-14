
a.out: main.o libass2_19CS30016.a
	gcc main.o -L. -Iass2_19CS30016.c

main.o: main.c my1.h
	gcc -Wall -c main.c

libass2_19CS30016.a: ass2_19CS30016.o
	ar -rcs libass2_19CS30016.a ass2_19CS30016.o

ass2_19CS30016.o: ass2_19CS30016.c my1.h
	gcc -Wall -c ass2_19CS30016.c

clean:
	rm a.out main.o libass2_19CS30016.a ass2_19CS30016.o